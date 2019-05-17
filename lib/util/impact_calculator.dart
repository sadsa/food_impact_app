import 'package:food_impact_app/food.dart';
import 'package:food_impact_app/frequency.dart';

class ImpactCalculator {
  double _kmsPerMile = 1.60934;
  double _kgPerMile = .392;
  int _kgPerPassenger = 320;
  int _kgPerPassengerGlobal = 470;
  int _metersSquaredPerCourt = 261;
  int _litresPerShower = 65;
  int _annualHomeHeatingEmmision = 2300;
  int _weeksInYear = 52;
  int _daysInYear = 365;

  double getNumberOfMiles(Food food, Frequency frequency) =>
      getGhgPerYear(food, frequency) / _kgPerMile;

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

  double getNumberOfDays(Food food, Frequency frequency) =>
      getGhgPerYear(food, frequency) /
      (_annualHomeHeatingEmmision / _daysInYear);

  double getNumberOfFlights(Food food, Frequency frequency) =>
      getGhgPerYear(food, frequency) / _kgPerPassenger;

  double getNumberOfFlightsGlobal(Food food, Frequency frequency) =>
      getGhgPerYear(food, frequency) / _kgPerPassengerGlobal;

  double getLandUsePerServing(Food food) => food.landUse;

  double getLandUse(Food food, Frequency frequency) {
    return (getLandUsePerServing(food) *
        getFrequencyValue(food, frequency) *
        _weeksInYear);
  }

  double getNumberOfCourts(double landUse) => landUse / _metersSquaredPerCourt;

  double getWaterUsePerServing(Food food) => food.waterUse;

  double getWaterUse(Food food, Frequency frequency) {
    return (getWaterUsePerServing(food) *
        getFrequencyValue(food, frequency) *
        _weeksInYear);
  }

  double getNumberOfShowers(double waterUse) =>
      waterUse / _litresPerShower;
}
