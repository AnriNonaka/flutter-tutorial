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
    //todoStateNotifierを監視している
    //todoStateNotifierに変化があったらビルドを再実行してくれる
    final state = ref.watch(foodStateNotifier);
    final notifier = ref.watch(foodStateNotifier.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text('料理リスト'),
        actions: [
          IconButton(
            onPressed: () => showDialog<Future>(
              context: context,
              builder: (context) => _filterTags(context, notifier),
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
        onPressed: () {
          _showEditDialog(context, notifier);
          // notifier.insertDummyData();
        },
        child: Icon(Icons.edit),
      ),
    );
  }

  Widget _filterTags(BuildContext context, FoodStateNotifier notifier) {
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

  Future<void> _showEditDialog(
      BuildContext context, FoodStateNotifier notifier) {
    final formKey = GlobalKey<FormState>();
    final title = TextEditingController();
    final tag1 = TextEditingController();
    final tag2 = TextEditingController();
    final tag3 = TextEditingController();
    final tag4 = TextEditingController();
    final tag5 = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            height: 250,
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
                  Consumer(builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    final state = ref.watch(foodInputStateNotifier);
                    final notifier = ref.watch(foodInputStateNotifier.notifier);
                    return ChoiceChip(
                      label: Text('和食'),
                      selected: state.tagSelectState?['和食'] ?? false,
                      onSelected: (newBoolValue) {
                        notifier.toggleTagChip('和食', newBoolValue);
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("キャンセル"),
            ),
            ElevatedButton(
              onPressed: () async {
                //バリデーションない時だけ保存処理実行
                if (formKey.currentState!.validate()) {
                  //TodosCompanionを初期化してる・「newFood」を作ってる
                  final newFood = FoodsCompanion(
                    title: drift.Value(title.text),
                    tag1: drift.Value(tag1.text),
                    tag2: drift.Value(tag2.text),
                    tag3: drift.Value(tag3.text),
                    tag4: drift.Value(tag4.text),
                    tag5: drift.Value(tag5.text),
                  );
                  //作った「_newTodo」を_notifierのinsertTodoDataに渡してる
                  //これで内部的にrepositoryを呼んでDBへの書き込みがされる
                  notifier.insertFoodData(newFood);
                  Navigator.pop(context);
                }
              },
              child: Text("保存"),
            )
          ],
        );
      },
    );
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
            Text('タイトル：${foodItems.title}'),
            Text(foodItems.tag1),
            Text(foodItems.tag2),
            Text(foodItems.tag3),
            Text(foodItems.tag4),
            Text(foodItems.tag5),
          ],
        ),
      ),
    );
  }
}
