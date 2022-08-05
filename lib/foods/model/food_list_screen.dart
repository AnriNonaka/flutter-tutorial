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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(foodStateNotifier);
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
        //Container＞BoxDecorationの中にImageを入れていたが、下記に修正
        flexibleSpace: Image.asset('images/料理2.jpg', fit: BoxFit.cover),
        actions: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 6.0),
                child: IconButton(
                  onPressed: () async => _showFilterDialog(context, ref),
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
          : _buildFoodList(state, ref),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent.shade100,
        onPressed: () {
          _showInputDialog(context, ref);
        },
        // ダミーデータを入れる際に必要なため残しておきます。
        // ref.read(foodStateNotifier.notifier).insertDummyData();},
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

  Widget _buildFoodList(FoodListState state, WidgetRef ref) {
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
                  ref
                      .read(foodStateNotifier.notifier)
                      .deleteFoodData(foodData.id);
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

  Future<void> _showFilterDialog(BuildContext context, WidgetRef ref) async {
    // showDialogは値を返す。その値を使って判定を行いデータの再読み込みを行う。
    final tags = await showDialog<List<String>>(
      context: context,
      builder: (context) {
        return Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            //ここでHashMapに入ったstateが来る
            final state = ref.watch(foodFilterStateNotifier);
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
                              ref
                                  .read(foodFilterStateNotifier.notifier)
                                  .filterToggleTagChip(
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
    // nullチェック
    // 早期リターンする方法がgood
    if (tags == null) {
      return;
    }
    await ref.read(foodStateNotifier.notifier).getFilteredFoodData(tags);
  }

// HashMapに入ってるValue (タグのON,OFFの状態)のtrueのkeyを抽出して,
// filterEnableTagsというListを作っている
  List<String> getFilterEnableTags(HashMap<String, bool> tags) =>
      tags.entries.where((element) => element.value).map((e) => e.key).toList();

  Future<void> _showInputDialog(BuildContext context, WidgetRef ref) async {
    final formKey = GlobalKey<FormState>();
    final title = TextEditingController();

    // showDialogは値を返す。その値を使って判定を行いデータの再読み込みを行う。
    final needRefresh = await showDialog<bool>(
      context: context,
      builder: (context) {
        final state = ref.watch(foodInputStateNotifier);

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
                                state.tagData?[_choiceList[index]] ?? false,
                            onSelected: (newBoolValue) {
                              //trueだったらfalse返ってくる(逆も)
                              ref
                                  .read(foodInputStateNotifier.notifier)
                                  .toggleTagChip(
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
                  final tags = getEnableTags(state.tagData ?? HashMap());
                  //「newFood」が作られる(タイトル、タグ1~5(空のタグ含む) のセット)
                  final newFood = createSaveData(title.text, tags);
                  //作った「_newTodo」を_notifierのinsertTodoDataに渡してる
                  //これで内部的にrepositoryを呼んでDBへの書き込みがされる
                  ref
                      .read(foodInputStateNotifier.notifier)
                      .insertFoodData(newFood);
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

    if (needRefresh == true) {
      ref.read(foodStateNotifier.notifier).getFoodData();
    }
  }

// HashMapに入ってるValue (タグのON,OFFの状態)のtrueのkeyを抽出してListを作っている
// Zennメモあり
  List<String> getEnableTags(HashMap<String, bool> tags) =>
      tags.entries.where((element) => element.value).map((e) => e.key).toList();

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
                _chip(foodItems.tag1),
                _chip(foodItems.tag2),
                _chip(foodItems.tag3),
                _chip(foodItems.tag4),
                _chip(foodItems.tag5),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 元々、tag1~5のメソッド5個あったのを、
  // 引数だけをいじって使ってメソッドを1個にした。(動画あり)
  Widget _chip(String tag) {
    if (tag.isEmpty) {
      return SizedBox.shrink();
    } else {
      return Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: Chip(
          label: Text(
            '${tag}',
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
