import 'package:flutter_tutorial/foods/model/food_list_db.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_list_state.freezed.dart';

@freezed
class FoodListState with _$FoodListState {
  // DBの状態を保持するクラス
  //画面上で変更したいものがある場合にここで定義する
  const factory FoodListState({
    //読み込み中の時はプログレス出したいよって時
    @Default(false) bool isLoading,
    @Default(false) bool isReadyData,
    //読み込み終わったあとに表示させる
    @Default(<Food>[]) List<Food> foodItems,
  }) = _FoodListState;
}