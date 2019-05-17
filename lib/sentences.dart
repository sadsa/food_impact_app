import 'package:flutter/widgets.dart';
import 'package:food_impact_app/food.dart';
import 'package:food_impact_app/food_model.dart';
import 'package:food_impact_app/frequency.dart';
import 'package:food_impact_app/util/impact_calculator.dart';
import 'package:sprintf/sprintf.dart';

class Sentence {
  final String key;
  final String text;
  final String imageUrl;
  List<dynamic> tokenValues = [];
  Sentence({this.key, this.text, this.imageUrl});
}

class SentenceWidgetFactory {
  static ImpactCalculator _calc = new ImpactCalculator();

  static Widget create(Sentence sentence, FoodModel model) {
    Food food = model.selectedFood;
    Frequency frequency = model.selectedFrequency;
    switch (sentence.key) {
      case SentenceKeys.ghgSentence1:
        var values = ghgSentenceValues(food, frequency);
        sentence.tokenValues = values;
        return _buildSentence(sentence);
        break;
      case SentenceKeys.ghgSentence2:
        double ghgPerYear = _calc.getGhgPerYear(
            model.selectedFood, model.selectedFrequency);
        sentence.tokenValues.add(ghgPerYear);
        return _buildSentence(sentence);
        break;
      default:
        return Text('Could not construct Widget with key: $sentence.key');
    }
  }

  static List<double> ghgSentenceValues(Food food, Frequency frequency) {
    double numberOfMiles = _calc.getNumberOfMiles(
        food, frequency);
    double numberOfKms = _calc.getNumberOfKm(
        numberOfMiles);            
    return [numberOfMiles, numberOfKms];
  }

  static List<double> ghgSentence2Values(Food food, Frequency frequency) {
    double numberOfMiles = _calc.getNumberOfMiles(
        food, frequency);
    double numberOfKms = _calc.getNumberOfKm(
        numberOfMiles);            
    return [numberOfMiles, numberOfKms];
  }

  static Widget _buildSentence(Sentence sentence) {
    List<dynamic> calcValues = sentence.tokenValues;
    String text = _replaceWithCalculatedValues(sentence.text, calcValues);
    return Text(text);
  }

  static String _replaceWithCalculatedValues(
      String sentence, List<dynamic> values) {
    return sprintf(sentence, values);
  }
}

class SentenceKeys {
  static const String ghgSentence1 = "GHG_Sentence_1";
  static const String ghgSentence2 = "GHG_Sentence_2";
  static const String ghgSentence3 = "GHG_Sentence_3";
  static const String landSentence = "Land_Sentence";
  static const String waterSentence = "Water_Sentence";
}

Map<String, Sentence> Sentences = {
  SentenceKeys.ghgSentence1: new Sentence(
      key: SentenceKeys.ghgSentence1,
      text:
          "That's the equivalent of driving a regular petrol car %s miles (%skm).",
      imageUrl: ""),
  SentenceKeys.ghgSentence2: new Sentence(
      key: SentenceKeys.ghgSentence2,
      text: "the same as heating the average UK home for %s days.",
      imageUrl: ""),
  SentenceKeys.ghgSentence3: new Sentence(
      key: SentenceKeys.ghgSentence3,
      text: "like taking %s return flight from London to Malaga.",
      imageUrl: ""),
  SentenceKeys.landSentence: new Sentence(
      key: SentenceKeys.landSentence,
      text: "%sm² land, equal to the space of %s tennis courts.",
      imageUrl: ""),
  SentenceKeys.waterSentence: new Sentence(
      key: SentenceKeys.waterSentence,
      text: "%s litres of water, equal to %s showers lasting eight minutes.",
      imageUrl: ""),
};

// String tokenReplace(String template, List<String> replacements) {
//   RegExp exp = new RegExp(r"{{([^{}]*)}}");
//   replacements.forEach((String str) {
//     template = template.replaceFirstMapped(
//         exp, (Match m) => "${m[1].isNotEmpty ? str : ''}");
//   });
//   return template;
// }
