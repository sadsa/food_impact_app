import 'package:food_impact_app/frequency.dart';
import 'package:scoped_model/scoped_model.dart';
import 'food.dart';

class FoodModel extends Model {
  List<Food> _foods = new List<Food>();
  List<Frequency> frequencies = [
    new Frequency("1-2 times a week", 1.5),
    new Frequency("3-5 times a week", 4),
    new Frequency("Once a day", 7),
    new Frequency("Twice a day or more", 14),
    new Frequency("Never", 0),
  ];
  Food _selectedFood;
  Frequency _selectedFrequency;

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

  Frequency get selectedFrequency => _selectedFrequency;

  set selectedFrequency(Frequency value) {
    _selectedFrequency = value;
    notifyListeners();
  }
}
