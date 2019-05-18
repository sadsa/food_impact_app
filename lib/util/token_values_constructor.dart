import 'package:food_impact_app/config/sentences.dart';
import 'package:food_impact_app/entities/food.dart';
import 'package:food_impact_app/entities/frequency.dart';
import 'package:food_impact_app/models/food_model.dart';
import 'package:food_impact_app/util/impact_calculator.dart';

class TokenValuesConstructor {
  ImpactCalculator _calc = new ImpactCalculator();

  Food _foodChoice;
  Frequency _frequencyChoice;

  TokenValuesConstructor(FoodModel model) {
    _foodChoice = model.foodChoice;
    _frequencyChoice = model.frequencyChoice;
  }

  List<double> _ghgSentenceValues() {
    double numberOfMiles =
        _calc.getNumberOfMiles(_foodChoice, _frequencyChoice);
    double numberOfKms = _calc.getNumberOfKm(numberOfMiles);
    return [numberOfMiles, numberOfKms];
  }

  List<double> _ghgSentence2Values() {
    double numberOfDays = _calc.getNumberOfDays(_foodChoice, _frequencyChoice);
    return [numberOfDays];
  }

  List<double> _ghgSentence3Values() {
    double numberOfFlights =
        _calc.getNumberOfFlights(_foodChoice, _frequencyChoice);
    return [numberOfFlights];
  }

  List<double> _landSentenceValues() {
    double landUse = _calc.getLandUse(_foodChoice, _frequencyChoice);
    double numberOfCourts = _calc.getNumberOfCourts(landUse);
    return [landUse, numberOfCourts];
  }

  List<double> _waterSentenceValues() {
    double waterUse = _calc.getWaterUse(_foodChoice, _frequencyChoice);
    double numberOfShowers = _calc.getNumberOfShowers(waterUse);
    return [waterUse, numberOfShowers];
  }

  List<double> getValues(String sentenceKey) {
    switch (sentenceKey) {
      case SentenceKeys.ghgSentence1:
        return _ghgSentenceValues();
        break;
      case SentenceKeys.ghgSentence2:
        return _ghgSentence2Values();
        break;
      case SentenceKeys.ghgSentence3:
        return _ghgSentence3Values();
        break;
      case SentenceKeys.landSentence:
        return _landSentenceValues();
        break;
      case SentenceKeys.waterSentence:
        return _waterSentenceValues();
        break;
      default:
        return [];
    }
  }
}