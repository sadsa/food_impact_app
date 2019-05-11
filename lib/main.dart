import 'package:flutter/material.dart';
import 'package:food_impact_app/home/home_page.dart';
import 'package:scoped_model/scoped_model.dart';
import 'food_model.dart';

void main() {
  var model = FoodModel();

  runApp(ScopedModel<FoodModel>(
    model: model,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Impact Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Food Impact Calculator'),
    );
  }
}
