import 'package:flutter/widgets.dart';
import 'package:food_impact_app/food.dart';
import 'package:food_impact_app/food_model.dart';
import 'package:food_impact_app/sentences.dart';
import 'package:scoped_model/scoped_model.dart';

class ResultsSentences extends StatefulWidget {
  @override
  _ResultsSentencesState createState() => _ResultsSentencesState();
}

class _ResultsSentencesState extends State<ResultsSentences> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildBody(),
    );
  }

  _buildBody() {
    return ScopedModelDescendant<FoodModel>(builder: (context, child, model) {
      return Column(
        children: _buildSentences(model),
      );
    });
  }

  List<Widget> _buildSentences(FoodModel model) {
    Food food = model.selectedFood;
    List<String> sentenceKeys = food.getSentenceKeys();
    List<Widget> widgets = <Widget>[];
    sentenceKeys.forEach((key) {
      Sentence sentence = Sentences[key];
      widgets.add(SentenceWidgetBuilder.create(sentence));
    });
    return widgets;
  }
}
