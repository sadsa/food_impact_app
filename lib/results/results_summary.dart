import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_impact_app/food.dart';
import 'package:food_impact_app/food_model.dart';
import 'package:food_impact_app/frequency.dart';
import 'package:food_impact_app/util/impact_calculator.dart';
import 'package:scoped_model/scoped_model.dart';

class ResultsSummary extends StatefulWidget {
  @override
  _ResultsSummaryState createState() => _ResultsSummaryState();
}

class _ResultsSummaryState extends State<ResultsSummary> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ScopedModelDescendant<FoodModel>(builder: (context, child, model) {
      var food = model.selectedFood;
      var frequency = model.selectedFrequency;
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _summaryImage(),
          _servingSize(food),
          _impactSentence(food, frequency)
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
    if (food == null) return Text('-');
    var servingSize = food.servingSize.toString();
    return Text('$servingSize per serving');
  }

  Widget _impactSentence(Food food, Frequency frequency) {
    if (food == null) return Text('Please select a Food');
    var ghgPerYear = ImpactCalculator.getGhgPerYearRounded(food, frequency);
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
