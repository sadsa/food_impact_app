import 'package:flutter/widgets.dart';

class Sentence {
  final String text;
  final String imageUrl;
  const Sentence({this.text, this.imageUrl});
}

class SentenceWidgetBuilder {
  static Widget create(Sentence sentence) {
    return Text(sentence.text);
  }
}

const Map<String, Sentence> Sentences = {
  "GHG.sentence.1": const Sentence(
      text:
          "That's the equivalent of driving a regular petrol car %s miles (%skm).",
      imageUrl: ""),
  "GHG.sentence.2": const Sentence(
      text: "the same as heating the average UK home for %s days.",
      imageUrl: ""),
  "GHG.sentence.3": const Sentence(
      text: "like taking %s return flight from London to Malaga.",
      imageUrl: ""),
  "Land.sentence": const Sentence(
      text: "%sm² land, equal to the space of %s tennis courts.", imageUrl: ""),
  "Water.sentence": const Sentence(
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
