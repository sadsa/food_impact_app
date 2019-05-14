import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_impact_app/food.dart';
import 'package:food_impact_app/food_model.dart';
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
    var ghgPerYearRounded = ghgPerYear.floor();
    var foodName = food.name.toString();
    return RichText(
      text: TextSpan(
        text:
            'Over an entire year your consumption of $foodName is contributing',
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
              text: ' $ghgPerYearRounded kg',
              style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: ' to your annual greenhouse gas emissions.'),
        ],
      ),
    );
  }
}
