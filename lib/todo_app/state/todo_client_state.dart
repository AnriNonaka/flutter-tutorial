import 'package:flutter_tutorial/todo_app/state/todo_db.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_client_state.freezed.dart';

@freezed
class TodoClientState with _$TodoClientState {
  // DBの状態を保持するクラス
  //画面上で変更したいものがある場合にここで定義する
  const factory TodoClientState({
    //読み込み中の時はプログレス出したいよって時
    @Default(false) bool isLoading,
    @Default(false) bool isReadyData,
    @Default([Todo]) List<Todo> todoItems,
  }) = _TodoClientState;
}
