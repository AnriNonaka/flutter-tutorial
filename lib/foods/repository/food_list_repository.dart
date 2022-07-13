import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/foods/model/food_list_db.dart';

final foodRepository = Provider(
      (ref) => FoodRepository(),
);

class FoodRepository {
  MyDatabase database = MyDatabase();

  Future<List<Food>> getAllFoodData() async {
    final foodList = database.readAllFoodData;
    return foodList;
  }

  Future insertFoodData(FoodsCompanion food) async {
    return await database.writeFood(food);
  }

  Future updateFoodData(FoodsCompanion food) async {
    return await database.updateFood(food);
  }

  Future deleteFoodData(int id) async {
    return await database.deleteFood(id);
  }
}