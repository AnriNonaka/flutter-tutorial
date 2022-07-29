import 'package:flutter_tutorial/foods/model/food_list_db.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_list_state.freezed.dart';

@freezed
class FoodListState with _$FoodListState {
  // DBの状態を保持するクラス
  //画面上で変更したいものがある場合にここで定義する
  const factory FoodListState({
    //ローディング中か
    @Default(false) bool isLoading,
    //リストが揃ってるか
    @Default(false) bool isReadyData,
    //読み込み終わったあとに表示させるリストの中身
    //filterDialogの時はこのfoodItemsを絞り込みする
    @Default(<Food>[]) List<Food> foodItems,
    //現在どんなフォルターで絞り込んでるか
    @Default(<String>[]) List<String> tags,
  }) = _FoodListState;
}
