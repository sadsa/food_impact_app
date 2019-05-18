import 'package:flutter/widgets.dart';
import 'package:food_impact_app/entities/food.dart';
import 'package:food_impact_app/entities/frequency.dart';
import 'package:food_impact_app/entities/sentence.dart';
import 'package:food_impact_app/models/food_model.dart';
import 'package:food_impact_app/util/sentence_widget_factory.dart';
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
    Food food = model.foodChoice;
    Frequency frequency = model.frequencyChoice;
    List<Widget> widgets = <Widget>[];
    if (food == null || frequency == null) return widgets;
    List<Sentence> sentences = food.getSentences();
    sentences.forEach((sentence) {
      widgets.add(SentenceWidgetFactory.create(sentence, model));
    });
    return widgets;
  }
}
