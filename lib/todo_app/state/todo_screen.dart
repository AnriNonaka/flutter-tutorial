import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_tutorial/todo_app/state/todo_client_state.dart';
import 'package:flutter_tutorial/todo_app/state/todo_db.dart';
import 'package:flutter_tutorial/todo_app/state/todo_state_notifier.dart';
import 'package:drift/drift.dart' as drift;
import 'package:intl/intl.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //todoStateNotifierを監視している
    //todoStateNotifierに変化があったらビルドを再実行してくれる
    final state = ref.watch(todoStateNotifier);
    final notifier = ref.watch(todoStateNotifier.notifier);
    return Scaffold(
      //「todoItems」が空なら「_buildEmptyTodo」、データ入ってたら「_buildTodoList」に行く
      body: state.todoItems.isEmpty
          ? _buildEmptyTodo()
          : _buildTodoList(state, notifier),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showEditDialog(context, notifier);
        },
        child: const Icon(Icons.edit),
      ),
    );
  }

  Widget _buildEmptyTodo() {
    return const Center(
      child: Text(
        '登録しているTodoはありません',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTodoList(TodoClientState state, TodoStateNotifier notifier) {
    return Stack(
      children: [
        Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: state.todoItems.length,
              itemBuilder: ((context, index) {
                final todoData = state.todoItems[index];
                return Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          notifier.deleteTodoData(todoData.id);
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
                        _buildToDo(todoData),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        )
      ],
    );
  }

  _showEditDialog(BuildContext context, TodoStateNotifier notifier) {
    final formKey = GlobalKey<FormState>();
    final addDate = DateTime.now();
    final title = TextEditingController();
    final _description = TextEditingController();
    var _limitData = TextEditingController();
    final _format = DateFormat('yyyy-MM-dd');

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
                    decoration: const InputDecoration(
                      hintText: "タイトルを入力してください",
                      icon: Icon(Icons.text_fields_outlined),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '入力してください';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: description,
                    decoration: const InputDecoration(
                      hintText: "内容を入力してください",
                      icon: Icon(Icons.notes),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '入力してください';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '入力してください';
                      }
                      return null;
                    },
                    controller: _limitData,
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2022),
                        lastDate: DateTime(2023),
                        helpText: '日付を選択',
                        cancelText: 'キャンセル',
                        confirmText: '決定',
                      );
                      final formatDate = format.format(date!);
                      limitData.text = formatDate;
                    },
                    decoration: const InputDecoration(
                      hintText: '期限を選択してください',
                      icon: Icon(Icons.calendar_today),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("キャンセル"),
            ),
            ElevatedButton(
              onPressed: () async {
                final limitDate = format.parseStrict(limitData.text);
                //バリデーションない時だけ保存処理実行
                if (formKey.currentState!.validate()) {
                  //TodosCompanionを初期化してる・「_newTodo」を作ってる
                  final newTodo = TodosCompanion(
                    title: drift.Value(title.text),
                    description: drift.Value(description.text),
                    addDate: drift.Value(addDate),
                    limitDate: drift.Value(limitDate),
                  );
                  //作った「_newTodo」を_notifierのinsertTodoDataに渡してる
                  //これで内部的にrepositoryを呼んでDBへの書き込みがされる
                  notifier.insertTodoData(newTodo);
                  Navigator.pop(context);
                }
              },
              child: const Text("保存"),
            )
          ],
        );
      },
    );
  }

  Widget _buildToDo(Todo todoItems) {
    DateFormat outputFormat = DateFormat('yyyy-MM-dd');
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('タイトル：${todoItems.title}'),
              Text(todoItems.description, style: const TextStyle(fontSize: 24)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('作成日：${outputFormat.format(todoItems.addDate)}'),
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    '期日：${outputFormat.format(todoItems.limitDate)}',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 211, 127, 17)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
