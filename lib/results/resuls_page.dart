import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_impact_app/food.dart';
import 'package:food_impact_app/food_model.dart';
import 'package:food_impact_app/util/impact_calculator.dart';
import 'package:scoped_model/scoped_model.dart';

class ResultsPage extends StatefulWidget {
  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  _buildBody() {
    return Center(
      child: _resultsSummary(),
    );
  }

  Widget _resultsSummary() {
    return ScopedModelDescendant<FoodModel>(builder: (context, child, model) {
      var food = model.selectedFood;
      var calc = new ImpactCalculator(model);
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _summaryImage(),
          _servingSize(food),
          _impactSentence(food, calc)
        ],
      );
    });
  }

  Widget _summaryImage() {
    final String assetName = 'assets/food_20.svg';
    final Widget svg = new SvgPicture.asset(assetName);
    return Container(
      child: svg,
    );
  }

  Widget _servingSize(Food food) {
    var servingSize = food.servingSize.toString();
    return Text('$servingSize per serving');
  }

  Widget _impactSentence(Food food, ImpactCalculator calc) {
    var ghgPerYear = calc.getGhgPerYear();
    var foodName = food.name.toString();
    return RichText(
      text: TextSpan(
        text:
            'Over an entire year your consumption of $foodName is contributing',
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
              text: ' $ghgPerYear kg',
              style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: ' to your annual greenhouse gas emissions.'),
        ],
      ),
    );
  }
}
