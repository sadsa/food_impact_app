import 'package:food_impact_app/entities/sentence.dart';

class SentenceKeys {
  static const String ghgSentence1 = "GHG_Sentence_1";
  static const String ghgSentence2 = "GHG_Sentence_2";
  static const String ghgSentence3 = "GHG_Sentence_3";
  static const String landSentence = "Land_Sentence";
  static const String waterSentence = "Water_Sentence";
}

const Map<String, Sentence> Sentences = {
  SentenceKeys.ghgSentence1: const Sentence(
      key: SentenceKeys.ghgSentence1,
      text:
          "That's the equivalent of driving a regular petrol car %s miles (%skm).",
      imageUrl: "assets/GHG.sentence.1.svg"),
  SentenceKeys.ghgSentence2: const Sentence(
      key: SentenceKeys.ghgSentence2,
      text: "the same as heating the average UK home for %s days.",
      imageUrl: "assets/GHG.sentence.2.svg"),
  SentenceKeys.ghgSentence3: const Sentence(
      key: SentenceKeys.ghgSentence3,
      text: "like taking %s return flight from London to Malaga.",
      imageUrl: "assets/GHG.sentence.3.svg"),
  SentenceKeys.landSentence: const Sentence(
      key: SentenceKeys.landSentence,
      text: "%sm² land, equal to the space of %s tennis courts.",
      imageUrl: "assets/Land.sentence.svg"),
  SentenceKeys.waterSentence: const Sentence(
      key: SentenceKeys.waterSentence,
      text: "%s litres of water, equal to %s showers lasting eight minutes.",
      imageUrl: "assets/Water.sentence.svg"),
};
