import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_impact_app/food_data_service.dart';
import 'package:food_impact_app/food_model.dart';
import 'package:food_impact_app/home/food_selector_form.dart';
import 'package:scoped_model/scoped_model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    _initFoods();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: _buildBody());
  }

  _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FoodSelectorForm(),
          // Next part
        ],
      ),
    );
  }

  _initFoods() {
    FoodDataService.getFoods().then((value) {
      ScopedModel.of<FoodModel>(context).foods = value;
    });
  }
}