import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_impact_app/food.dart';
import 'package:food_impact_app/food_model.dart';
import 'package:food_impact_app/frequency.dart';
import 'package:food_impact_app/util/impact_calculator.dart';
import 'package:sprintf/sprintf.dart';

class Sentence {
  final String key;
  final String text;
  final String imageUrl;
  List<double> tokenValues = [];
  Sentence({this.key, this.text, this.imageUrl});
}

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

class SentenceWidgetFactory {
  static Widget create(Sentence sentence, FoodModel model) {
    if (sentence.key == null) {
      return Text('Could not construct Widget with key: $sentence.key');
    }
    var valuesConstr = new TokenValuesConstructor(model);
    var tokenValues = valuesConstr.getValues(sentence.key);
    sentence.tokenValues = tokenValues;
    return _buildSentence(sentence);
  }

  static Widget _buildSentence(Sentence sentence) {
    return Column(
      children: <Widget>[
        _buildImage(sentence.imageUrl),
        _buildSentenceText(sentence)
      ],
    );
  }

  static Widget _buildImage(String imageUrl) {
    final Widget svg = new SvgPicture.asset(imageUrl);
    return Container(
      child: svg,
    );
  }

  static _buildSentenceText(Sentence sentence) {
    String formattedText =
        TokenHelper.tokenReplace(sentence.text, sentence.tokenValues);
    return Text(formattedText);
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
      imageUrl: "assets/GHG.sentence.1.svg"),
  SentenceKeys.ghgSentence2: new Sentence(
      key: SentenceKeys.ghgSentence2,
      text: "the same as heating the average UK home for %s days.",
      imageUrl: "assets/GHG.sentence.2.svg"),
  SentenceKeys.ghgSentence3: new Sentence(
      key: SentenceKeys.ghgSentence3,
      text: "like taking %s return flight from London to Malaga.",
      imageUrl: "assets/GHG.sentence.3.svg"),
  SentenceKeys.landSentence: new Sentence(
      key: SentenceKeys.landSentence,
      text: "%sm² land, equal to the space of %s tennis courts.",
      imageUrl: "assets/Land.sentence.svg"),
  SentenceKeys.waterSentence: new Sentence(
      key: SentenceKeys.waterSentence,
      text: "%s litres of water, equal to %s showers lasting eight minutes.",
      imageUrl: "assets/Water.sentence.svg"),
};

class TokenHelper {
  static String tokenReplace(String text, List<dynamic> values) {
    return sprintf(text, values);
  }

  // static String tokenReplace(String template, List<String> replacements) {
  //   RegExp exp = new RegExp(r"{{([^{}]*)}}");
  //   replacements.forEach((String str) {
  //     template = template.replaceFirstMapped(
  //         exp, (Match m) => "${m[1].isNotEmpty ? str : ''}");
  //   });
  //   return template;
  // }
}
