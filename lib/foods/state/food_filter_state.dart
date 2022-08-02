import 'dart:collection';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_filter_state.freezed.dart';

@freezed
class FoodFilterState with _$FoodFilterState{
  // DBの状態を保持するクラス
  //画面上で変更したいものがある場合にここで定義する
  const factory FoodFilterState({
    //ローディング中か
    @Default(false) bool isLoading,
    //リストが揃ってるか
    @Default(false) bool isReadyData,
    //読み込み終わったあとに表示させるリストの中身
    HashMap<String,bool>? filterTagSelectState,
  }) = _FoodFilterState;
}