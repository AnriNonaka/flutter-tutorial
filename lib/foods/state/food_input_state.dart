import 'dart:collection';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_input_state.freezed.dart';

@freezed
class FoodInputState with _$FoodInputState {
  // DBの状態を保持するクラス
  //画面上で変更したいものがある場合にここで定義する
  const factory FoodInputState({
    //読み込み中の時はプログレス出したいよって時
    @Default(false) bool isLoading,
    @Default(false) bool isReadyData,
    //inputDialogのタグの選択がHashMapに保存される
     HashMap<String,bool>? tagSelectState,
  }) = _FoodInputState;
}