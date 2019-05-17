import 'package:food_impact_app/food.dart';
import 'package:food_impact_app/frequency.dart';

class ImpactCalculator {
  double _kmsPerMile = 1.60934;
  double _kgPerMile = .392;
  int _kgPerPassenger = 320;
  int _kgPerPassengerWS = 470;
  int _metersSquaredPerCourt = 261;
  int _litersPerShower = 65;
  int _annualHomeHeatingEmmision = 2300;
  int _weeksInYear = 52;
  int _daysInYear = 365;

  double getNumberOfMiles(Food food, Frequency frequency) =>
      getGhgPerYear(food, frequency);

  double getGhgPerServing(Food food) {
    if (food == null) return 0;
    return food.ghg;
  }

  double getAverageServingsPerWeek(Food food) {
    if (food == null) return 0;
    return food.avgServingsGlobal;
  }

  double getFrequencyValue(Food food, Frequency frequency) {
    if (food == null || frequency == null) return 0;
    return frequency.value;
  }

  double getGhgPerYear(Food food, Frequency frequency) {
    if (food == null || frequency == null) return 0;
    return getGhgPerServing(food) *
        getFrequencyValue(food, frequency) *
        _weeksInYear;
  }

  int getGhgPerYearRounded(Food food, Frequency frequency) =>
      getGhgPerYear(food, frequency).floor();

  double getNumberOfKm(double numberOfMiles) => numberOfMiles * _kmsPerMile;
}
