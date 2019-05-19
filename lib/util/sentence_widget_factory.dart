import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_impact_app/entities/sentence.dart';
import 'package:food_impact_app/models/food_model.dart';
import 'package:food_impact_app/util/token_formatter.dart';
import 'package:food_impact_app/util/token_values_constructor.dart';

class SentenceWidgetFactory {
  static Widget create(Sentence sentence, FoodModel model) {
    if (sentence.key == null) {
      return Text('Could not construct Widget with key: $sentence.key');
    }
    var valuesConstructor = new TokenValuesConstructor(model);
    var tokenValues = valuesConstructor.getValues(sentence.key);
    return _buildSentence(sentence, tokenValues);
  }

  static Widget _buildSentence(Sentence sentence, List<double> tokenValues) {
    return Column(
      children: <Widget>[
        _buildImage(sentence.imageUrl),
        _buildSentenceText(sentence.text, tokenValues)
      ],
    );
  }

  static Widget _buildImage(String imageUrl) {
    final Widget svg = new SvgPicture.asset(imageUrl);
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: svg,
    );
  }

  static _buildSentenceText(String text, List<double> tokenValues) {
    List<String> tokens = TokenFormatter.formatList(tokenValues);
    String formattedText = TokenFormatter.replace(text, tokens);
    return Container(
      child: Text(
        formattedText,
        textAlign: TextAlign.center,
      ),
      padding: EdgeInsets.only(bottom: 10),
    );
  }
}
