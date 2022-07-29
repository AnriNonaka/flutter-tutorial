import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/foods/model/food_list_db.dart';

// シングルトン対応にしている(dbページも変更あり)

final foodRepository = Provider(
  (ref) => FoodRepository(),
);

class FoodRepository {
  FoodRepository() {
    _database = MyDatabase.getInstance();
  }

  late MyDatabase _database;

  Future<List<Food>> getAllFoodData() async {
    final foodList = _database.readAllFoodData;
    return foodList;
  }

  Future insertFoodData(FoodsCompanion food) async {
    return await _database.writeFood(food);
  }

  Future deleteFoodData(int id) async {
    return await _database.deleteFood(id);
  }
}
