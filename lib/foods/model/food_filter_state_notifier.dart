import 'dart:collection';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/foods/repository/food_list_repository.dart';
import 'package:flutter_tutorial/foods/state/food_filter_state.dart';

//データベースとView間のやりとりを状態管理する

final foodFilterStateNotifier =
    StateNotifierProvider<FoodFilterStateNotifier, FoodFilterState>(
  (ref) => FoodFilterStateNotifier(),
);

class FoodFilterStateNotifier extends StateNotifier<FoodFilterState> {
  FoodFilterStateNotifier() : super(FoodFilterState()) {}

  final _repository = FoodListRepository();

//toggle:ONとOFFを切り替える(電気スイッチみたいに)
//isEnable：有効です(trueだったら有効、falseだったら有効じゃない)
  Future<void> filterToggleTagChip(String tag, bool isEnable) async {
    final HashMap<String, bool> filterTagSelectState =
        state.filterTagSelectState ?? HashMap<String, bool>();
    List<String> enableTags = [];
    // HashMap. keyのListを取得できる。このリストを使って、ループを行って、フィルターを使う
    filterTagSelectState.entries
        .where((element) => element.value)
        .forEach((element) {
      enableTags.add(element.key);
    });
    // tagSelectState(HashMap)の中にtrueの数が2個以上
    // 且つisEnableがtrueならreturnする
    if (enableTags.length > 1 && isEnable) {
      //ここで早期リターンして、ここ以下の処理はしない
      return;
    }

    //filterTagSelectStateのtagをkey(String)としてEnableで書き換えてる
    filterTagSelectState[tag] = isEnable;

    //上でEnableで書き換えたものがfilterTagSelectStateに入ってくる
    state = state.copyWith(filterTagSelectState: filterTagSelectState);
  }
}
