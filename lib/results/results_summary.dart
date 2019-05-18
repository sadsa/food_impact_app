import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_impact_app/entities/food.dart';
import 'package:food_impact_app/entities/frequency.dart';
import 'package:food_impact_app/models/food_model.dart';
import 'package:food_impact_app/util/impact_calculator.dart';
import 'package:food_impact_app/util/token_formatter.dart';
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
      var food = model.foodChoice;
      var frequency = model.frequencyChoice;
      if (food == null || frequency == null)
        return Text('Please select a Food');
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _summaryImage(food),
          _servingSize(food),
          _impactSentence(food, frequency)
        ],
      );
    });
  }

  Widget _summaryImage(Food food) {
    if (food == null) return Text('-');
    final String assetName =
        'assets/food_' + (!food.key.isNaN ? '${food.key + 1}.svg' : '20.svg');
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
    ImpactCalculator calc = new ImpactCalculator();
    double ghgPerYear = calc.getGhgPerYear(food, frequency);
    String ghgPerYearFormatted = TokenFormatter.format(ghgPerYear);
    var foodName = food.name.toString();
    return RichText(
      text: TextSpan(
        text:
            'Over an entire year your consumption of $foodName is contributing',
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
              text: ' ${ghgPerYearFormatted}kg',
              style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: ' to your annual greenhouse gas emissions.'),
        ],
      ),
    );
  }
}
