import 'package:food_impact_app/food.dart';
import 'package:food_impact_app/food_model.dart';
import 'package:food_impact_app/frequency.dart';

class CalculationFigures {
  double kmsPerMile = 1.60934;
  double kgPerMile = .392;
  int kgPerPassenger = 320;
  int kgPerPassengerWS = 470;
  int metersSquaredPerCourt = 261;
  int litersPerShower = 65;
  int annualHomeHeatingEmmision = 2300;
  int weeksInYear = 52;
  int daysInYear = 365;
}

class ImpactCalculator {
  Food _selectedFood;
  Frequency _selectedFrequency;

  var figures = new CalculationFigures();

  ImpactCalculator(FoodModel model) {
    _selectedFood = model.selectedFood;
    _selectedFrequency = model.selectedFrequency;
  }

  double getGhgPerServing() {
    if (_selectedFood == null) return 0;
    return _selectedFood.ghg;
  }

  double getAverageServingsPerWeek() {
    if (_selectedFood == null) return 0;
    return _selectedFood.avgServingsGlobal;
  }

  double getFrequencyValue() {
    if (_selectedFood == null) return 0;
    return _selectedFrequency.value;
  }

  double getGhgPerYear() {
    return getGhgPerServing() *
        getFrequencyValue() *
        figures.weeksInYear;
  }
}
