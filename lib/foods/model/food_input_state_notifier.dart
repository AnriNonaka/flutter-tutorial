import 'dart:collection';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/foods/state/food_input_state.dart';

final foodInputStateNotifier =
StateNotifierProvider<FoodInputStateNotifier, FoodInputState>(
      (ref) => FoodInputStateNotifier(),
);

//FoodListStateをstateとして持つStateNotifier。
//StateNotifierの責務
//1：ステートを更新する（ステートを更新したいと思ったらStateNotifierに処理を書く）
//2：データの加工を行う
//3：リポジトリからデータを取る
class FoodInputStateNotifier extends StateNotifier<FoodInputState> {
  FoodInputStateNotifier() : super(FoodInputState()) {
  }

  Future toggleTagChip(String tag,bool isEnable)async{
    final HashMap<String,bool> tagSelectState = state.tagSelectState ?? HashMap<String,bool>();

    tagSelectState[tag] = isEnable;

    //chipの状態を更新する処理を書く
    state = state.copyWith(tagSelectState: tagSelectState);
  }
}