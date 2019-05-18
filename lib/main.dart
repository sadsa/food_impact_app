import 'package:flutter/material.dart';
import 'package:food_impact_app/home/home_page.dart';
import 'package:food_impact_app/models/food_model.dart';
import 'package:food_impact_app/results/resuls_page.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  var model = FoodModel();
  model.loadData();

  runApp(ScopedModel<FoodModel>(
    model: model,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(title: 'Food Impact Calculator'),
        '/results': (context) => ResultsPage(title: 'Results')
      },
      title: 'Food Impact Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
