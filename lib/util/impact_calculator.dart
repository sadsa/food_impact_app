import 'package:food_impact_app/food.dart';
import 'package:food_impact_app/frequency.dart';

class ImpactCalculator {
  static double kmsPerMile = 1.60934;
  static double kgPerMile = .392;
  static int kgPerPassenger = 320;
  static int kgPerPassengerWS = 470;
  static int metersSquaredPerCourt = 261;
  static int litersPerShower = 65;
  static int annualHomeHeatingEmmision = 2300;
  static int weeksInYear = 52;
  static int daysInYear = 365;

  static double getGhgPerServing(Food food) {
    if (food == null) return 0;
    return food.ghg;
  }

  static double getAverageServingsPerWeek(Food food) {
    if (food == null) return 0;
    return food.avgServingsGlobal;
  }

  static double getFrequencyValue(Food food, Frequency frequency) {
    if (food == null || frequency == null) return 0;
    return frequency.value;
  }

  static double getGhgPerYear(Food food, Frequency frequency) {
    if (food == null || frequency == null) return 0;
    return getGhgPerServing(food) *
        getFrequencyValue(food, frequency) *
        weeksInYear;
  }

  static int getGhgPerYearRounded(Food food, Frequency frequency) =>
      getGhgPerYear(food, frequency).floor();
}
