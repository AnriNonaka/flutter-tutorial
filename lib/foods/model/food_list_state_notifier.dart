import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/foods/repository/food_list_repository.dart';
import 'package:flutter_tutorial/foods/state/food_list_state.dart';

import 'food_list_db.dart';

//データベースとView間のやりとりを状態管理する

final foodStateNotifier =
    StateNotifierProvider<FoodStateNotifier, FoodListState>(
  (ref) => FoodStateNotifier(ref.read),
);

// DBの操作を行うクラス （dbの操作にstateを絡める）
//FoodListStateをstateとして持つStateNotifier。
class FoodStateNotifier extends StateNotifier<FoodListState> {
  FoodStateNotifier(this.read) : super(const FoodListState()) {
    //FoodDataを取得
    getFoodData();
  }

  final Reader read;
  late final _repository = read(foodListRepository);

  Future<void> getFoodData() async {
    //読み込み中のフラグを立ててる
    //コピーを作ってstateにセットする
    //screen側のビルドが再度走る
    state = state.copyWith(isLoading: true);

    //DBから値を取ってきます
    final List<Food> foods = await _repository.getAllFoodData();

    //isExistTagsで該当するもの(tureが返ってきたfood)が、filteredFoodsに含まれる
    final Iterable<Food> filteredFoods =
        foods.where((food) => isExistTags(state.tags, food));

    //filteredFoods2 ：絞り込んだリスト
    final List<Food> filteredFoods2 = [];
    filteredFoods.forEach((element) {
      filteredFoods2.add(element);
    });

    //リストの要素が空ではない場合の処理
    if (foods.isNotEmpty) {
      //screen側のビルドが再度走る
      state = state.copyWith(
        //Loadingは終わってるからfalse
        isLoading: false,
        //データの用意があるからtrue
        isReadyData: true,
        //取得したリストをセットしてる
        //上で絞り込んだfilteredFoods2
        foodItems: filteredFoods2,
      );

      //リストの要素が空の場合の処理
    } else {
      //screen側のビルドが再度走る
      state = state.copyWith(
        isLoading: false,
        isReadyData: false,
        //空のリストをセットしてる
        foodItems: [],
      );
    }
  }

  //絞り込んだタグに該当するfoodがtrueで返ってくる
  bool isExistTags(List<String> tags, Food food) {
    //①絞り込みをしてない状態：全てtrue => 全部がisExistTagsに含まれる
    if (tags.isEmpty) {
      return true;
    }
    //②絞り込みタグ選択が1個の場合、ここを通る
    if (tags.length == 1) {
      // リストに含めない条件を作る
      if (food.tag1 != tags[0] &&
          food.tag2 != tags[0] &&
          food.tag3 != tags[0] &&
          food.tag4 != tags[0] &&
          food.tag5 != tags[0]) {
        return false;
      }
      //③絞り込みタグ選択が2個の場合、ここを通る
    } else if (tags.length == 2) {
      //絞ったタグの1個目がtag1~5に対して全てnotイコール(!=)だったらfalse(リストに含まない)
      if (food.tag1 != tags[0] &&
          food.tag2 != tags[0] &&
          food.tag3 != tags[0] &&
          food.tag4 != tags[0] &&
          food.tag5 != tags[0]) {
        return false;
        //絞った2個目のタグが〜
      } else if (food.tag1 != tags[1] &&
          food.tag2 != tags[1] &&
          food.tag3 != tags[1] &&
          food.tag4 != tags[1] &&
          food.tag5 != tags[1]) {
        return false;
      }
    }
    //②③でfalseじゃなかったものがtrueになり,isExistTagsに入る
    return true;
  }

  Future<void> deleteFoodData(int id) async {
    await _repository.deleteFoodData(id);
    getFoodData();
  }

  //stateにtagsだけ登録して通常のgetFoodDataを呼び出す
  Future<void> getFilteredFoodData(List<String> tags) async {
    state = await state.copyWith(tags: tags);
    getFoodData();
  }

// ダミーデータを入れる際に必要なため残しておきます。
// Future insertDummyData() async{
//   List<FoodsCompanion> foods = [
//     FoodsCompanion( title: drift.Value('親子丼'),tag1: drift.Value('昼食'),tag2: drift.Value('夕食'),tag3: drift.Value('和食'),tag4: drift.Value('丼もの'),tag5: drift.Value('メイン')),
//     FoodsCompanion( title: drift.Value('枝豆と夏野菜のサーモンマリネ'),tag1: drift.Value('夕食'),tag2: drift.Value('サブ'),tag3: drift.Value('和食'),tag4: drift.Value('洋食'),tag5: drift.Value('海鮮')),
//     FoodsCompanion( title: drift.Value('鳥レバーの甘辛煮'),tag1: drift.Value('夕食'),tag2: drift.Value('和食'),tag3: drift.Value('サブ'),tag4: drift.Value('つまみ'),tag5: drift.Value('')),
//     FoodsCompanion( title: drift.Value('蒸籠蒸し'),tag1: drift.Value('夕食'),tag2: drift.Value('メイン'),tag3: drift.Value('豚肉'),tag4: drift.Value(''),tag5: drift.Value('')),
//     FoodsCompanion( title: drift.Value('だし巻き卵'),tag1: drift.Value('夕食'),tag2: drift.Value('和食'),tag3: drift.Value('つまみ'),tag4: drift.Value('サブ'),tag5: drift.Value('')),
//     FoodsCompanion( title: drift.Value('いきなり団子'),tag1: drift.Value('お菓子'),tag2: drift.Value('和食'),tag3: drift.Value(''),tag4: drift.Value(''),tag5: drift.Value('')),
//     FoodsCompanion( title: drift.Value('スイートポテト'),tag1: drift.Value('お菓子'),tag2: drift.Value('洋食'),tag3: drift.Value(''),tag4: drift.Value(''),tag5: drift.Value('')),
//     FoodsCompanion( title: drift.Value('焼きそば'),tag1: drift.Value('夕食'),tag2: drift.Value('昼食'),tag3: drift.Value('和食'),tag4: drift.Value('アジア'),tag5: drift.Value('メイン')),
//     FoodsCompanion( title: drift.Value('麻婆豆腐'),tag1: drift.Value('中華'),tag2: drift.Value('夕食'),tag3: drift.Value('メイン'),tag4: drift.Value(''),tag5: drift.Value('')),
//     FoodsCompanion( title: drift.Value('オムライス'),tag1: drift.Value('昼食'),tag2: drift.Value('洋食'),tag3: drift.Value('メイン'),tag4: drift.Value(''),tag5: drift.Value('')),
//     FoodsCompanion( title: drift.Value('がめに'),tag1: drift.Value('夕食'),tag2: drift.Value('サブ'),tag3: drift.Value('和食'),tag4: drift.Value('サブ'),tag5: drift.Value('')),
//     FoodsCompanion( title: drift.Value('高野豆腐'),tag1: drift.Value('夕食'),tag2: drift.Value('サブ'),tag3: drift.Value('和食'),tag4: drift.Value('サブ'),tag5: drift.Value('')),
//     FoodsCompanion( title: drift.Value('白和え'),tag1: drift.Value('夕食'),tag2: drift.Value('サブ'),tag3: drift.Value('和食'),tag4: drift.Value('サブ'),tag5: drift.Value('')),
//     FoodsCompanion( title: drift.Value('りんごと春菊のサラダ'),tag1: drift.Value('夕食'),tag2: drift.Value('サブ'),tag3: drift.Value('和食'),tag4: drift.Value('サラダ'),tag5: drift.Value('')),
//     FoodsCompanion( title: drift.Value('手羽と玉子の煮込み'),tag1: drift.Value('夕食'),tag2: drift.Value('メイン'),tag3: drift.Value('和食'),tag4: drift.Value('鶏肉'),tag5: drift.Value('')),
//     FoodsCompanion( title: drift.Value('山芋鉄板'),tag1: drift.Value('夕食'),tag2: drift.Value('サブ'),tag3: drift.Value('和食'),tag4: drift.Value('つまみ'),tag5: drift.Value('')),
//     FoodsCompanion( title: drift.Value('シーチキンとカブのサラダ'),tag1: drift.Value('夕食'),tag2: drift.Value('サブ'),tag3: drift.Value('和食'),tag4: drift.Value('サラダ'),tag5: drift.Value('')),
//     FoodsCompanion( title: drift.Value('あさりご飯'),tag1: drift.Value('夕食'),tag2: drift.Value('メイン'),tag3: drift.Value('サブ'),tag4: drift.Value('和食'),tag5: drift.Value('海鮮')),
//     FoodsCompanion( title: drift.Value('大根と帆立のサラダ'),tag1: drift.Value('夕食'),tag2: drift.Value('サブ'),tag3: drift.Value('和食'),tag4: drift.Value('サラダ'),tag5: drift.Value('')),
//     FoodsCompanion( title: drift.Value('ピザトースト'),tag1: drift.Value('朝食'),tag2: drift.Value('洋食'),tag3: drift.Value('メイン'),tag4: drift.Value(''),tag5: drift.Value('')),
//   ];
//
//   foods.forEach((food) { _repository.insertFoodData(food);});
//   getFoodData();
// }
}
