import 'package:flutter/material.dart';
import 'package:food_impact_app/food.dart';
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ScopedModelDescendant<FoodModel>(
        builder: (context, child, model) => Column(
              children: <Widget>[
                _foodField(model),
                _frequencyField(model),
                FlatButton(
                  color: Theme.of(context).buttonColor,
                  child: Text('Find out'),
                  onPressed: () => null,
                )
              ],
            ),
      ),
    );
  }

  Widget _foodField(FoodModel model) {
    return DropdownButtonFormField(
      decoration: InputDecoration(labelText: 'Which food would you like?'),
      items: DropdownFactory._buildFoodItems(model.foods),
      value: model.selectedFood,
      onChanged: _setSelectedFood,
    );
  }

  Widget _frequencyField(FoodModel model) {
    return DropdownButtonFormField(
      decoration: InputDecoration(labelText: 'How often fo you have it?'),
      items: DropdownFactory._buildFrequencyItems(model.frequencies),
      value: model.selectedFrequency,
      onChanged: _setSelectedFrequency,
    );
  }

  void _setSelectedFood(Food value) {
    ScopedModel.of<FoodModel>(context).selectedFood = value;
  }

  void _setSelectedFrequency(String value) {
    ScopedModel.of<FoodModel>(context).selectedFrequency = value;
  }
}

class DropdownFactory {
  static List<DropdownMenuItem<Food>> _buildFoodItems(List<Food> items) {
    return items
        .map((item) => DropdownMenuItem(
              child: Text(item.name),
              value: item,
            ))
        .toList();
  }

  static List<DropdownMenuItem<String>> _buildFrequencyItems(
      List<String> items) {
    return items
        .map((item) => DropdownMenuItem(
              child: Text(item),
              value: item,
            ))
        .toList();
  }
}
