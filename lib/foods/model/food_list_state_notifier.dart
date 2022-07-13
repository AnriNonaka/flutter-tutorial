import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/foods/repository/food_list_repository.dart';
import 'package:flutter_tutorial/foods/state/food_list_state.dart';
import 'package:drift/drift.dart' as drift;

import 'food_list_db.dart';

//データベースとView間のやりとりを状態管理する

final foodStateNotifier =
    StateNotifierProvider<FoodStateNotifier, FoodListState>(
  (ref) => FoodStateNotifier(),
);

// DBの操作を行うクラス （dbの操作にstateを絡める）
//FoodListStateをstateとして持つStateNotifier。
class FoodStateNotifier extends StateNotifier<FoodListState> {
  FoodStateNotifier() : super(const FoodListState()) {
    //FoodDataを取得
    getFoodData();
  }

  final _repository = FoodRepository();

  Future getFoodData() async {
    //読み込み中のフラグを立ててる
    //コピーを作ってstateにセットする
    //screen側のビルドが再度走る
    state = state.copyWith(isLoading: true);

    //DBから値を取ってきます
    final List<Food> foods = await _repository.getAllFoodData();

    //リストの要素が空ではない場合の処理
    if (foods.isNotEmpty) {
      //screen側のビルドが再度走る
      state = state.copyWith(
        //Loadingは終わってるからfalse
        isLoading: false,
        //データの用意があるからtrue
        isReadyData: true,
        //取得したリストをセットしてる
        foodItems: foods,
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

  //絞りこんだタグがtagsに入ってくる
  bool isExistTags(List<String> tags, Food food) {
    //絞り込みをしてない状態：全てtrue => 全部がisExistTagsに含まれる
    if (tags.isEmpty) {
      return true;
    }
    //絞ったタグの1個目がtag1~5に対してnotイコール(!=)だったらfalse
    if (food.tag1 != tags[0] &&
        food.tag2 != tags[0] &&
        food.tag3 != tags[0] &&
        food.tag4 != tags[0] &&
        food.tag5 != tags[0]) {
      return false;
      //絞った2個目のタグ〜
    } else if (food.tag1 != tags[1] &&
        food.tag2 != tags[1] &&
        food.tag3 != tags[1] &&
        food.tag4 != tags[1] &&
        food.tag5 != tags[1]) {
      return false;
    }
    //上2つでtrueならfilteredFoodsに含まれる
    return true;
  }
  //絞りこんだタグがtagsに入ってくる
  Future getFilteredFoodData(List<String> tags) async {
    //読み込み中のフラグを立ててる
    //コピーを作ってstateにセットする
    //screen側のビルドが再度走る
    state = state.copyWith(isLoading: true);

    //DBから登録した全FoodData取ってくる => foodsに入ってる
    final List<Food> foods = await _repository.getAllFoodData();

    //isExistTagsで2個のタグで絞り込んだ時に、
    // 該当するもの(tureが返ってきた場合)、filteredFoodsに含まれる
    final Iterable<Food> filteredFoods =
        foods.where((food) => isExistTags(tags, food));

    //リストの要素が空ではない場合の処理
    if (foods.isNotEmpty) {
      //screen側のビルドが再度走る
      state = state.copyWith(
        //Loadingは終わってるからfalse
        isLoading: false,
        //データの用意があるからtrue
        isReadyData: true,
        //取得したリストをセットしてる
        foodItems: foods,
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

  //保存したデータを含めてもう1回ロードして画面構築をしている
  Future insertFoodData(FoodsCompanion food) async {
    //ローディングたてて
    state = state.copyWith(isLoading: true);
    //新規でレコード追加して
    _repository.insertFoodData(food);
    //データをゲットする
    await getFoodData();
  }

  Future deleteFoodData(int id) async {
    await _repository.deleteFoodData(id);
    getFoodData();
  }

  // Future insertDummyData() async{
  //   List<FoodsCompanion> foods = [
  //     FoodsCompanion( title: drift.Value('親子丼'), tag1: drift.Value('昼食'),tag2: drift.Value('昼食'),tag3: drift.Value('夕食'),tag4: drift.Value('和食'),tag5: drift.Value('丼もの')),
  //     FoodsCompanion( title: drift.Value('枝豆と夏野菜のサーモンマリネ'), tag1: drift.Value('夕食'),tag2: drift.Value('夕食'),tag3: drift.Value('サブ'),tag4: drift.Value('和食'),tag5: drift.Value('洋食')),
  //     FoodsCompanion( title: drift.Value('鳥レバーの甘辛煮'), tag1: drift.Value('夕食'),tag2: drift.Value('夕食'),tag3: drift.Value('夕食'),tag4: drift.Value('和食'),tag5: drift.Value('')),
  //     FoodsCompanion( title: drift.Value('蒸籠蒸し'), tag1: drift.Value('夕食'),tag2: drift.Value('夕食'),tag3: drift.Value('メイン'),tag4: drift.Value('豚肉'),tag5: drift.Value('')),
  //     FoodsCompanion( title: drift.Value('だし巻き卵'), tag1: drift.Value('夕食'),tag2: drift.Value('夕食'),tag3: drift.Value('夕食'),tag4: drift.Value('和食'),tag5: drift.Value('')),
  //     FoodsCompanion( title: drift.Value('いきなり団子'), tag1: drift.Value('お菓子'),tag2: drift.Value('お菓子'),tag3: drift.Value('和食'),tag4: drift.Value(''),tag5: drift.Value('')),
  //     FoodsCompanion( title: drift.Value('スイートポテト'), tag1: drift.Value('お菓子'),tag2: drift.Value('お菓子'),tag3: drift.Value('洋食'),tag4: drift.Value(''),tag5: drift.Value('')),
  //     FoodsCompanion( title: drift.Value('焼きそば'), tag1: drift.Value('夕食'),tag2: drift.Value('夕食'),tag3: drift.Value('昼食'),tag4: drift.Value('和食'),tag5: drift.Value('アジア')),
  //     FoodsCompanion( title: drift.Value('麻婆豆腐'), tag1: drift.Value('中華'),tag2: drift.Value('中華'),tag3: drift.Value('夕食'),tag4: drift.Value(''),tag5: drift.Value('')),
  //     FoodsCompanion( title: drift.Value('オムライス'), tag1: drift.Value('昼食'),tag2: drift.Value('昼食'),tag3: drift.Value('洋食'),tag4: drift.Value('メイン'),tag5: drift.Value('')),
  //     FoodsCompanion( title: drift.Value('がめに'), tag1: drift.Value('夕食'),tag2: drift.Value('夕食'),tag3: drift.Value('サブ'),tag4: drift.Value('和食'),tag5: drift.Value('')),
  //     FoodsCompanion( title: drift.Value('高野豆腐'), tag1: drift.Value('夕食'),tag2: drift.Value('夕食'),tag3: drift.Value('サブ'),tag4: drift.Value('和食'),tag5: drift.Value('')),
  //     FoodsCompanion( title: drift.Value('白和'), tag1: drift.Value('夕食'),tag2: drift.Value('夕食'),tag3: drift.Value('サブ'),tag4: drift.Value('和食'),tag5: drift.Value('')),
  //     FoodsCompanion( title: drift.Value('りんごと春菊のサラダ'), tag1: drift.Value('夕食'),tag2: drift.Value('夕食'),tag3: drift.Value('サブ'),tag4: drift.Value('和食'),tag5: drift.Value('サラダ')),
  //     FoodsCompanion( title: drift.Value('手羽と玉子の煮込み'), tag1: drift.Value('夕食'),tag2: drift.Value('夕食'),tag3: drift.Value('メイン'),tag4: drift.Value('和食'),tag5: drift.Value('鶏肉')),
  //     FoodsCompanion( title: drift.Value('山芋鉄板'), tag1: drift.Value('夕食'),tag2: drift.Value('夕食'),tag3: drift.Value('サブ'),tag4: drift.Value('和食'),tag5: drift.Value('つまみ')),
  //     FoodsCompanion( title: drift.Value('シーチキンとカブのサラダ'), tag1: drift.Value('夕食'),tag2: drift.Value('夕食'),tag3: drift.Value('サブ'),tag4: drift.Value('和食'),tag5: drift.Value('サラダ')),
  //     FoodsCompanion( title: drift.Value('あさりご飯'), tag1: drift.Value('夕食'),tag2: drift.Value('夕食'),tag3: drift.Value('メイン'),tag4: drift.Value('サブ'),tag5: drift.Value('和食')),
  //     FoodsCompanion( title: drift.Value('大根と帆立のサラダ'), tag1: drift.Value('夕食'),tag2: drift.Value('夕食'),tag3: drift.Value('サブ'),tag4: drift.Value('和食'),tag5: drift.Value('サラダ')),
  //     FoodsCompanion( title: drift.Value('ピザトースト'), tag1: drift.Value('朝食'),tag2: drift.Value('朝食'),tag3: drift.Value('洋食'),tag4: drift.Value(''),tag5: drift.Value('')),
  //   ];
  //
  //   foods.forEach((food) { _repository.insertFoodData(food);});
  //   getFoodData();
  // }

}
