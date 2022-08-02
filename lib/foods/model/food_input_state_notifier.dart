import 'dart:collection';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/foods/model/food_list_db.dart';
import 'package:flutter_tutorial/foods/repository/food_list_repository.dart';
import 'package:flutter_tutorial/foods/state/food_input_state.dart';

final foodInputStateNotifier =
    StateNotifierProvider<FoodInputStateNotifier, FoodInputState>(
  (ref) => FoodInputStateNotifier(),
);

//FoodInputStateNotifierをstateとして持つStateNotifier。
//StateNotifierの責務(順不同)
//1：リポジトリからデータを取る
//2：データの加工を行う(並び替えとかフィルタリングとか)
//3：stateを更新する（ステートを更新したいと思ったらStateNotifierに処理を書く）
class FoodInputStateNotifier extends StateNotifier<FoodInputState> {
  FoodInputStateNotifier() : super(FoodInputState()) {}

  final _repository = FoodListRepository();

  //toggle:ONとOFFを切り替える(電気スイッチみたいに)
  //isEnable：有効です(trueだったら有効です、falseだったら有効じゃないです)
  Future<void> toggleTagChip(String tag, bool isEnable) async {
    final HashMap<String, bool> tagSelectState =
        state.tagData ?? HashMap<String, bool>();
    List<String> enableTags = [];
    // HashMap. keyのListを取得できる。このリストを使って、ループを行って、フィルターを使う
    tagSelectState.entries.where((element) => element.value).forEach((element) {
      enableTags.add(element.key);
    });
    // tagSelectState(HashMap)の中にtrueの数が5個以上
    // 且つisEnableがtrueならreturnする
    if (enableTags.length > 4 && isEnable) {
      //ここで早期リターンして、ここ以下の処理はしない
      return;
    }

    //tagSelectStateのtagをkey(String)としてEnableで書き換えてる
    tagSelectState[tag] = isEnable;

    //上でEnableで書き換えたものがtagSelectStateに入ってくる
    state = state.copyWith(tagData: tagSelectState);
  }

  //保存したデータを含めてもう1回ロードして画面構築をしている
  Future<void> insertFoodData(FoodsCompanion food) async {
    //ローディングたてて
    state = state.copyWith(isLoading: true);
    //新規でレコード追加して
    _repository.insertFoodData(food);
  }
}
