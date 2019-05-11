import 'package:scoped_model/scoped_model.dart';
import 'food.dart';

class FoodModel extends Model {
  List<Food> foods = new List<Food>();

  addFoods(Iterable<Food> newFoods) {
    foods.addAll(newFoods);
    notifyListeners();
  }
}