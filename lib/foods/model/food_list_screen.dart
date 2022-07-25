import 'dart:collection';
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
          strokeWidth: 1.8,
          strokeColor: Colors.black54,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/料理2.jpg'), fit: BoxFit.cover),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () =>
                showDialog<Future>(
                  context: context,
                  builder: (context) => _showFilterDialog(context, notifier),
                ),
            icon: Icon(Icons.filter_list),
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
          // notifier.insertDummyData();
        },
        child: Icon(Icons.edit),
      ),
    );
  }

  Widget _showFilterDialog(BuildContext context, FoodStateNotifier notifier) {
    return AlertDialog(
      title: Text('検索'),
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

  Future<void> _showInputDialog(BuildContext context,
      FoodStateNotifier notifier) async {
    //Form用のキー作成
    final formKey = GlobalKey<FormState>();
    final title = TextEditingController();

    // showDialogは値を返す。その値を使って判定を行いデータの再読み込みを行う。
    final needRefresh = await showDialog<bool>(
      context: context,
      builder: (context) {
        return Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final state = ref.watch(foodInputStateNotifier);
            //ここでHashMapに入ったstateが来る
            final notifier = ref.watch(foodInputStateNotifier.notifier);
            return AlertDialog(
              content: SizedBox(
                height: 420,
                width: double.maxFinite,
                //Consumerで囲むことにより、ダイアログ全体にアクセスできるようにする
                //タイトル〜選択したタグまでを保存できるように
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: title,
                        decoration: InputDecoration(
                          hintText: "料理名を入力してください",
                          icon: Icon(Icons.text_fields_outlined),
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
                                  selectedColor: Colors.green,
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
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: Text("キャンセル"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    //バリデーションない時だけ保存処理実行
                    if (formKey.currentState!.validate()) {
                      //tagsの中に、HashMapの中でtrueになったタグのStringが入ってくる
                      final tags =
                      getEnableTags(state.tagSelectState ?? HashMap());
                      //「newFood」が作られる(タイトル、タグ1~5(空のタグ含む) のセット)
                      print('//「newFood」が作られる(タイトル、タグ1~5(空のタグ含む) のセット)');
                      // createSaveDataで
                      final newFood = createSaveData(title.text, tags);
                      //作った「_newTodo」を_notifierのinsertTodoDataに渡してる
                      print('//作った「_newTodo」を_notifierのinsertTodoDataに渡してる');
                      //これで内部的にrepositoryを呼んでDBへの書き込みがされる
                      notifier.insertFoodData(newFood);
                      print('//これで内部的にrepositoryを呼んでDBへの書き込みがされる');
                      //showDialogでtrueを返す
                      Navigator.pop(context, true);
                      print('Navigator.pop(context, true);');
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
      print('needRefresh = $needRefresh 2');
      notifier.getFoodData();
    }
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
  String getTagByIndex(List<String> tags,
      int index,) {
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
                  padding: const EdgeInsets.only(right: 8.0),
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
            Wrap(
              children: [
                Chip(
                  label: Text(
                    '${foodItems.tag1}',
                    style: TextStyle(fontSize: 11),
                  ),
                  backgroundColor: Colors.greenAccent.shade100,
                  labelPadding: EdgeInsets.symmetric(horizontal: 5),
                  visualDensity: VisualDensity(horizontal: 0.0, vertical: -4),
                ),
                Chip(
                  label: Text(
                    '${foodItems.tag2}',
                    style: TextStyle(fontSize: 11),
                  ),
                  backgroundColor: Colors.greenAccent.shade100,
                  labelPadding: EdgeInsets.symmetric(horizontal: 5),
                  visualDensity: VisualDensity(horizontal: 0.0, vertical: -4),
                ),
                Chip(
                  label: Text(
                    '${foodItems.tag3}',
                    style: TextStyle(fontSize: 11),
                  ),
                  backgroundColor: Colors.greenAccent.shade100,
                  labelPadding: EdgeInsets.symmetric(horizontal: 5),
                  visualDensity: VisualDensity(horizontal: 0.0, vertical: -4),
                ),
                Chip(
                  label: Text(
                    '${foodItems.tag4}',
                    style: TextStyle(fontSize: 11),
                  ),
                  backgroundColor: Colors.greenAccent.shade100,
                  labelPadding: EdgeInsets.symmetric(horizontal: 5),
                  visualDensity: VisualDensity(horizontal: 0.0, vertical: -4),
                ),
                Chip(
                  label: Text(
                    '${foodItems.tag5}',
                    style: TextStyle(fontSize: 11),
                  ),
                  backgroundColor: Colors.greenAccent.shade100,
                  labelPadding: EdgeInsets.symmetric(horizontal: 5),
                  visualDensity: VisualDensity(horizontal: 0.0, vertical: -4),
                ),
              ],
            ),
          ],
        ),
      ),
    );
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
}
