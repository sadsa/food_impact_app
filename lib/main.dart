import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:firebase_database/firebase_database.dart';

void main() {
  var model = FoodModel();

  runApp(ScopedModel<FoodModel>(
    model: model,
    child: MyApp(),
  ));
}

class FoodModel extends Model {
  List<Food> foods = new List<Food>();

  addFoods(Iterable<Food> newFoods) {
    foods.addAll(newFoods);
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    _setFoods();
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
        children: <Widget>[FoodSelectorForm()],
      ),
    );
  }

  _setFoods() {
    FoodDataService.getFoods().then((value) {
      ScopedModel.of<FoodModel>(context).addFoods(value);
    });
  }
}

class FoodSelectorForm extends StatefulWidget {
  @override
  FoodSelectorFormState createState() {
    return FoodSelectorFormState();
  }
}

class FoodSelectorFormState extends State<FoodSelectorForm> {
  final _formKey = GlobalKey<FormState>();

  List<String> _foods = [
    "Farmed fishy",
    "Farmed prawns",
    "Pork",
  ];
  List<String> _frequencies = [
    "1-2 times per week",
    "3-5 times per week",
    "Once a day",
    "Never",
  ];
  String _selectedFood;
  String _selectedFrequency;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          DropdownButtonFormField(
            decoration:
                InputDecoration(labelText: 'Which food would you like?'),
            items: _buildBuildDropdownItems(_foods),
            onChanged: _setSelectedFood,
          ),
          DropdownButtonFormField(
            decoration: InputDecoration(
                labelText: 'How often fo you have it?',
                hintText: _frequencies[0]),
            items: _buildBuildDropdownItems(_frequencies),
            onChanged: _setSelectedFrequency,
          ),
          Text(_selectedFood.toString()),
          Text(_selectedFrequency.toString()),
          ScopedModelDescendant<FoodModel>(
            builder: (context, child, model) => model.foods.length > 0
                ? Text(model.foods.first.name)
                : LinearProgressIndicator(),
          )
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildBuildDropdownItems(List<String> items) {
    return items.map((item) {
      return DropdownMenuItem(
        child: Text(item),
        value: item,
      );
    }).toList();
  }

  void _setSelectedFood(String value) {
    setState(() {
      _selectedFood = value;
    });
  }

  void _setSelectedFrequency(String value) {
    setState(() {
      _selectedFrequency = value;
    });
  }
}

class Food {
  final String key;
  String name;
  String servingSize; //": "140g",
  double ghg; //": "1.876796141",
  double landUse; //": "1.158023151",
  double waterUse; //": "508.277153",
  String foodGroup; //": "Protein-rich foods",
  List<String> sentences; //": "GHG.sentence.1, GHG.sentence.2, Water.sentence",
  double avgServingsGlobal; //": "0.369237436",
  double avgServingsUk; //": "0.390283225"

  Food.fromJson(this.key, Map data) {
    name = data['food'] != null ? data['food'] : '';
  }
}

class FoodDataService {
  // FoodDataService.getFoods().then(_updateFoods);
  static Future<List<Food>> getFoods() async {
    Completer<List<Food>> completer = new Completer<List<Food>>();

    FirebaseDatabase.instance
        .reference()
        .child("Foods")
        .once()
        .then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      var foods = new List<Food>();
      values.forEach((key, value) {
        foods.add(new Food.fromJson(key, value));
      });
      completer.complete(foods);
    });

    return completer.future;
  }
}
