import 'package:scoped_model/scoped_model.dart';
import 'food.dart';

class FoodModel extends Model {
  List<Food> _foods = new List<Food>();
  List<String> frequencies = [
    "1-2 times per week",
    "3-5 times per week",
    "Once a day",
    "Never",
  ];
  Food _selectedFood;
  String _selectedFrequency;

  get foods => _foods;

  set foods(List<Food> foods) {
    _foods = foods;
    notifyListeners();
  }

  Food get selectedFood => _selectedFood;

  set selectedFood(Food value) {
    _selectedFood = value;
    notifyListeners();
  }

  String get selectedFrequency => _selectedFrequency;

  set selectedFrequency(String value) {
    _selectedFrequency = value;
    notifyListeners();
  }
}
