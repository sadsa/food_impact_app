import 'package:food_impact_app/data_service.dart';
import 'package:food_impact_app/entities/food.dart';
import 'package:food_impact_app/entities/frequency.dart';
import 'package:scoped_model/scoped_model.dart';

class FoodModel extends Model {
  List<Food> _foods = new List<Food>();
  List<Frequency> frequencies = [
    new Frequency("1-2 times a week", 1.5),
    new Frequency("3-5 times a week", 4),
    new Frequency("Once a day", 7),
    new Frequency("Twice a day or more", 14),
    new Frequency("Never", 0),
  ];
  Food _foodChoice;
  Frequency _frequencyChoice;

  get foods => _foods;

  set foods(List<Food> foods) {
    _foods = foods;
    notifyListeners();
  }

  Food get foodChoice => _foodChoice;

  set foodChoice(Food value) {
    _foodChoice = value;
    notifyListeners();
  }

  Frequency get frequencyChoice => _frequencyChoice;

  set frequencyChoice(Frequency value) {
    _frequencyChoice = value;
    notifyListeners();
  }

  Future loadData() async {
    var data = await DataService.getFoodData();
    foods = data;
  }
}
