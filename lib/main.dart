import 'package:flutter/material.dart';
import 'package:food_impact_app/home/home_page.dart';
import 'package:food_impact_app/models/food_model.dart';
import 'package:food_impact_app/results/resuls_page.dart';
import 'package:scoped_model/scoped_model.dart';

class AppColorPalette {
  static Color canvasBg = Color.fromRGBO(250, 244, 240, 1);
  static Color teal = Color.fromRGBO(18, 122, 154, 1);
  static Color textGrey = Color.fromRGBO(64, 64, 64, 1);
  static Color textDanger = Color.fromRGBO(204, 0, 0, 1);
  static Color textTeal = Color.fromRGBO(18, 122, 154, 1);
}

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
          fontFamily: 'BBC Reith Sans',
          primarySwatch: Colors.blue,
          canvasColor: AppColorPalette.canvasBg,
          appBarTheme: AppBarTheme(color: AppColorPalette.teal),
          textTheme: Theme.of(context)
              .textTheme
              .copyWith(headline: new TextStyle(fontWeight: FontWeight.w700))),
    );
  }
}
