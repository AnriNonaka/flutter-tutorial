import 'dart:collection';
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_tutorial/foods/model/food_filter_state_notifier.dart';
import 'package:flutter_tutorial/foods/model/food_input_state_notifier.dart';
import 'package:flutter_tutorial/foods/model/food_list_db.dart';
import 'package:flutter_tutorial/foods/model/food_list_state_notifier.dart';
import 'package:flutter_tutorial/foods/state/food_list_state.dart';
import 'package:drift/drift.dart' as drift;

class FoodListScreen extends ConsumerWidget {
  FoodListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //foodStateNotifierを監視している
    //foodStateNotifierに変化があったらビルドを再実行してくれる
    final state = ref.watch(foodStateNotifier);
    final notifier = ref.watch(foodStateNotifier.notifier);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: BorderedText(
          child: Text(
            'COOKING  REPERTOIRE',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          strokeWidth: 2,
          strokeColor: Colors.black54,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/料理2.jpg'), fit: BoxFit.cover),
          ),
        ),
        actions: [
          Stack(
            children: [

              Padding(
                padding: const EdgeInsets.only(right: 6.0),
                child: IconButton(
                  onPressed: () async => _showFilterDialog(context, notifier),
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Icon(
                      Icons.filter_alt,
                      color: Colors.black54,
                      size: 35,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      //「todoItems」が空なら「_buildEmptyTodo」、データ入ってたら「_buildTodoList」に行く
      body: state.foodItems.isEmpty
          ? _buildEmptyFood()
          : _buildFoodList(state, notifier),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent.shade100,
        onPressed: () {
          _showInputDialog(context, notifier);
        },
        // notifier.insertDummyData();},
        child: Icon(Icons.edit),
      ),
    );
  }

  Widget _buildEmptyFood() {
    return Center(
      child: Text(
        '登録しているFoodはありません',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildFoodList(FoodListState state, FoodStateNotifier notifier) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: state.foodItems.length,
      itemBuilder: ((context, index) {
        final foodData = state.foodItems[index];
        return Slidable(
          endActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  notifier.deleteFoodData(foodData.id);
                },
                backgroundColor: Colors.red,
                icon: Icons.delete,
                label: 'Delete',
              )
            ],
          ),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                _buildFood(foodData),
              ],
            ),
          ),
        );
      }),
    );
  }

  Future<void> _showFilterDialog(
      BuildContext context, FoodStateNotifier notifier) async {
    // showDialogは値を返す。その値を使って判定を行いデータの再読み込みを行う。
    final tags = await showDialog<List<String>>(
      context: context,
      builder: (context) {
        return Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final state = ref.watch(foodFilterStateNotifier);
            //ここでHashMapに入ったstateが来る
            final notifier = ref.watch(foodFilterStateNotifier.notifier);
            return AlertDialog(
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child:
                        Icon(Icons.restaurant_outlined, color: Colors.black54),
                  ),
                  Text(
                    '絞り込み',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              content: SizedBox(
                height: 380,
                width: double.maxFinite,
                child: Column(
                  children: [
                    Wrap(
                      children: List<Widget>.generate(_choiceList.length,
                          (int index) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ChoiceChip(
                            selectedColor: Colors.greenAccent.shade100,
                            label: Text(_choiceList[index]),
                            selected:
                                //[]の中にkeyとして文字列(_choices)を入れてる
                                //2行上のlabelと同じものを入れてる
                                //HashMapに対してこう書くとtrueかfalseが返る
                                //HashMapの中に[〜]のkeyが入ってない場合は無効として扱う
                                state.filterTagSelectState?[
                                        _choiceList[index]] ??
                                    false,
                            onSelected: (newBoolValue) {
                              //trueだったらfalse返ってくる(逆も)
                              notifier.filterToggleTagChip(
                                  _choiceList[index], newBoolValue);
                            },
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black26,
                    side: BorderSide(
                      color: Colors.black26,
                      width: 1, //太さ
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("キャンセル"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black26,
                    side: BorderSide(
                      color: Colors.black26,
                      width: 1, //太さ
                    ),
                  ),
                  onPressed: () async {
                    //tags(List)の中に、HashMapの中でtrueになったタグのString(List)が入ってくる
                    final tags = getFilterEnableTags(
                        state.filterTagSelectState ?? HashMap());

                    Navigator.pop(context, tags);
                  },
                  child: Text("絞り込み"),
                )
              ],
            );
          },
        );
      },
    );
    notifier.getFilteredFoodData(tags!);
  }

// HashMapに入ってるValue (タグのON,OFFの状態)のtrueのkeyを抽出して,
// filterEnableTagsというListを作っている
  List<String> getFilterEnableTags(HashMap<String, bool> tags) {
    List<String> filterEnableTags = [];
    // ここで絞り込みを行う
    // HashMap. keyのListを取得できる。このリストを使って、ループを行って、フィルターを使う
    tags.entries.where((element) => element.value).forEach((element) {
      filterEnableTags.add(element.key);
    });
    return filterEnableTags;
  }

  Future<void> _showInputDialog(
      BuildContext context, FoodStateNotifier notifier) async {
    final formKey = GlobalKey<FormState>();
    final title = TextEditingController();

    // showDialogは値を返す。その値を使って判定を行いデータの再読み込みを行う。
    final needRefresh = await showDialog<bool>(
      context: context,
      builder: (context) {
        //Consumerで囲むことにより、ダイアログ全体にアクセスできるようにする
        return Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final state = ref.watch(foodInputStateNotifier);
            //ここでHashMapに入ったstateが来る
            final notifier = ref.watch(foodInputStateNotifier.notifier);
            return AlertDialog(
              content: SizedBox(
                height: 410,
                width: double.maxFinite,
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: title,
                          decoration: InputDecoration(
                            hintText: "料理名を入力してください",
                            icon: Icon(Icons.restaurant_outlined),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '入力してください';
                            }
                            return null;
                          },
                        ),
                        Wrap(
                          children: List<Widget>.generate(_choiceList.length,
                              (int index) {
                            return Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: ChoiceChip(
                                selectedColor: Colors.greenAccent.shade100,
                                label: Text(_choiceList[index]),
                                //selectしてるかしてないか
                                selected:
                                    //[]の中にkeyとして文字列(_choices)を入れてる
                                    //2行上のlabelと同じものを入れてる
                                    //HashMapに対してこう書くとtrueかfalseが返る
                                    //HashMapの中に[〜]のkeyが入ってない場合は無効として扱う
                                    state.tagSelectState?[_choiceList[index]] ??
                                        false,
                                onSelected: (newBoolValue) {
                                  //trueだったらfalse返ってくる(逆も)
                                  notifier.toggleTagChip(
                                      _choiceList[index], newBoolValue);
                                },
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              actions: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black26,
                    side: BorderSide(
                      color: Colors.black26,
                      width: 1, //太さ
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context, false);
                    Navigator.pop(context, false);
                  },
                  child: Text("キャンセル"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black26,
                    side: BorderSide(
                      color: Colors.black26,
                      width: 1, //太さ
                    ),
                  ),
                  onPressed: () async {
                    //バリデーションない時だけ保存処理実行
                    if (formKey.currentState!.validate()) {
                      //tagsの中に、HashMapの中でtrueになったタグのStringが入ってくる
                      final tags =
                          getEnableTags(state.tagSelectState ?? HashMap());
                      //「newFood」が作られる(タイトル、タグ1~5(空のタグ含む) のセット)
                      final newFood = createSaveData(title.text, tags);
                      //作った「_newTodo」を_notifierのinsertTodoDataに渡してる
                      //これで内部的にrepositoryを呼んでDBへの書き込みがされる
                      notifier.insertFoodData(newFood);
                      //showDialogでtrueを返す
                      Navigator.pop(context, true);
                    }
                  },
                  child: Text("保存"),
                )
              ],
            );
          },
        );
      },
    );
    if (needRefresh == true) {
      notifier.getFoodData();
    }
  }

  final List<String> _choiceList = [
    "和食",
    "洋食",
    "アジア",
    "イタリアン",
    "中華",
    "海鮮",
    "朝食",
    "昼食",
    "夕食",
    "鍋もの",
    "丼もの",
    "メイン",
    "サブ",
    "汁物",
    "サラダ",
    "鶏肉",
    "豚肉",
    "牛肉",
    "つまみ",
    "お菓子",
    "飲み物",
    "その他",
  ];

// HashMapに入ってるValue (タグのON,OFFの状態)のtrueのkeyを抽出して,
// enableTagsというListを作っている
// Zennメモあり
  List<String> getEnableTags(HashMap<String, bool> tags) {
    List<String> enableTags = [];
    // ここで絞り込みを行う
    // HashMap. keyのListを取得できる。このリストを使って、ループを行って、フィルターを使う
    tags.entries.where((element) => element.value).forEach((element) {
      enableTags.add(element.key);
    });
    return enableTags;
  }

// getTagByIndexを使って、タグ選択が0〜4個の場合でもできるようにするメソッド
// FoodsCompanionのインスタンス
  FoodsCompanion createSaveData(String title, List<String> tags) {
    return FoodsCompanion(
      title: drift.Value(title),
      tag1: drift.Value(getTagByIndex(tags, 0)),
      tag2: drift.Value(getTagByIndex(tags, 1)),
      tag3: drift.Value(getTagByIndex(tags, 2)),
      tag4: drift.Value(getTagByIndex(tags, 3)),
      tag5: drift.Value(getTagByIndex(tags, 4)),
    );
  }

//上のメソッド内で使っている
  String getTagByIndex(
    List<String> tags,
    int index,
  ) {
    //  例) タグ選択3個の場合：
    if (tags.length > index) {
      // trueのindex0~2にはtagsを返す
      return tags[index];
    } else {
      // それ以外の3,4には空を返す
      return '';
    }
  }

  Widget _buildFood(Food foodItems) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Icon(Icons.restaurant_outlined),
                ),
                BorderedText(
                  child: Text(
                    '${foodItems.title}',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  strokeWidth: 1.0, //縁の太さ
                  strokeColor: Colors.black,
                ),
              ],
            ),
            Row(
              children: [
                _chip1(foodItems),
                _chip2(foodItems),
                _chip3(foodItems),
                _chip4(foodItems),
                _chip5(foodItems),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _chip1(Food foodItems) {
    if (foodItems.tag1.isEmpty) {
      return Column();
    } else {
      return Chip(
        label: Text(
          '${foodItems.tag1}',
          style: TextStyle(fontSize: 11),
        ),
        backgroundColor: Colors.greenAccent.shade100,
        labelPadding: EdgeInsets.symmetric(horizontal: 5),
        visualDensity: VisualDensity(horizontal: 0.0, vertical: -4),
      );
    }
  }

  Widget _chip2(Food foodItems) {
    if (foodItems.tag2.isEmpty) {
      return Column();
    } else {
      return Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: Chip(
          label: Text(
            '${foodItems.tag2}',
            style: TextStyle(fontSize: 11),
          ),
          backgroundColor: Colors.greenAccent.shade100,
          labelPadding: EdgeInsets.symmetric(horizontal: 5),
          visualDensity: VisualDensity(horizontal: 0.0, vertical: -4),
        ),
      );
    }
  }

  Widget _chip3(Food foodItems) {
    if (foodItems.tag3.isEmpty) {
      return Column();
    } else {
      return Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: Chip(
          label: Text(
            '${foodItems.tag3}',
            style: TextStyle(fontSize: 11),
          ),
          backgroundColor: Colors.greenAccent.shade100,
          labelPadding: EdgeInsets.symmetric(horizontal: 5),
          visualDensity: VisualDensity(horizontal: 0.0, vertical: -4),
        ),
      );
    }
  }

  Widget _chip4(Food foodItems) {
    if (foodItems.tag4.isEmpty) {
      return Column();
    } else {
      return Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: Chip(
          label: Text(
            '${foodItems.tag4}',
            style: TextStyle(fontSize: 11),
          ),
          backgroundColor: Colors.greenAccent.shade100,
          labelPadding: EdgeInsets.symmetric(horizontal: 5),
          visualDensity: VisualDensity(horizontal: 0.0, vertical: -4),
        ),
      );
    }
  }

  Widget _chip5(Food foodItems) {
    if (foodItems.tag5.isEmpty) {
      return Column();
    } else {
      return Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: Chip(
          label: Text(
            '${foodItems.tag5}',
            style: TextStyle(fontSize: 11),
          ),
          backgroundColor: Colors.greenAccent.shade100,
          labelPadding: EdgeInsets.symmetric(horizontal: 5),
          visualDensity: VisualDensity(horizontal: 0.0, vertical: -4),
        ),
      );
    }
  }
}
