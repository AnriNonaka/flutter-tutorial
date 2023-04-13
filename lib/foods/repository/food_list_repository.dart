import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/foods/model/food_list_db.dart';

// シングルトン対応にしている(dbページも変更あり)

final foodListRepository = Provider(
  (ref) => FoodListRepository(),
);

class FoodListRepository {
  FoodListRepository() {
    _database = MyDatabase.getInstance();
  }

  late MyDatabase _database;

  Future<List<Food>> getAllFoodData() async {
    final foodList = _database.getAllFoodData;
    return foodList;
  }

  Future<void> insertFoodData(FoodsCompanion food) async {
    return await _database.insertFood(food);
  }

  Future<void> deleteFoodData(int id) async {
    return await _database.deleteFood(id);
  }
}
