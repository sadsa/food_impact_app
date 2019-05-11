import 'package:flutter/material.dart';
import 'package:food_impact_app/food_model.dart';
import 'package:scoped_model/scoped_model.dart';

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
