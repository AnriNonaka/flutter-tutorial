import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/todo_app/repository/todo_repository.dart';
import 'package:flutter_tutorial/todo_app/state/todo_client_state.dart';
import 'package:flutter_tutorial/todo_app/state/todo_db.dart';

//データベースとView間のやりとりを状態管理する

final todoStateNotifier =
    StateNotifierProvider<TodoStateNotifier, TodoClientState>(
  (ref) => TodoStateNotifier(),
);

// DBの操作を行うクラス （dbの操作にstateを絡める）
//TodoClientStateをstateとして持つStateNotifier。
class TodoStateNotifier extends StateNotifier<TodoClientState> {
  TodoStateNotifier() : super(const TodoClientState()) {
    //TodoDataを取得
    getTodoData();
  }

  final _repository = TodoRepository();

  Future getTodoData() async {
    //読み込み中のフラグを立ててる
    //コピーを作ってstateにセットする
    //screen側のビルドが再度走る
    state = state.copyWith(isLoading: true);

    //DBから値を取ってきます
    final List<Todo> todos = await _repository.getAllTodoData();

    //リストの要素が空ではない場合の処理
    if (todos.isNotEmpty) {
      //screen側のビルドが再度走る
      state = state.copyWith(
        //Loadingは終わってるからfalse
        isLoading: false,
        //データの用意があるからtrue
        isReadyData: true,
        //取得したリストをセットしてる
        todoItems: todos,
      );
      //リストの要素が空の場合の処理
    } else {
      //screen側のビルドが再度走る
      state = state.copyWith(
        isLoading: false,
        isReadyData: false,
        //空のリストをセットしてる
        todoItems: [],
      );
    }
  }

//保存したデータを含めてもう1回ロードして画面構築をしている
  Future insertTodoData(TodosCompanion todo) async {
    //ローディングたてて
    state = state.copyWith(isLoading: true);
    //新規でレコード追加して
    _repository.insertTodoData(todo);
    //データをゲットする
    await getTodoData();
  }

  Future deleteTodoData(int id) async {
    await _repository.deleteTodoData(id);
    getTodoData();
  }
}
