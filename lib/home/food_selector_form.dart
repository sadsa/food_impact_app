import 'package:flutter/material.dart';
import 'package:food_impact_app/food.dart';
import 'package:food_impact_app/food_model.dart';
import 'package:food_impact_app/frequency.dart';
import 'package:food_impact_app/util/dropdown_factory.dart';
import 'package:scoped_model/scoped_model.dart';

class FoodSelectorForm extends StatefulWidget {
  final Function _submitCallback;

  FoodSelectorForm(this._submitCallback);

  @override
  FoodSelectorFormState createState() {
    return FoodSelectorFormState(_submitCallback);
  }
}

class FoodSelectorFormState extends State<FoodSelectorForm> {
  final _formKey = GlobalKey<FormState>();
  final _submitCallback;
  final _autovalidate = false;

  FoodSelectorFormState(this._submitCallback);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidate: _autovalidate,
      child: ScopedModelDescendant<FoodModel>(
        builder: (context, child, model) => Column(
              children: <Widget>[
                _foodField(model),
                _frequencyField(model),
                _submitButton()
              ],
            ),
      ),
    );
  }

  Widget _foodField(FoodModel model) {
    return DropdownButtonFormField(
      decoration: InputDecoration(labelText: 'Which food would you like?'),
      items: DropdownFactory.buildFoodItems(model.foods),
      value: model.selectedFood,
      onChanged: _setSelectedFood,
      validator: (Food value) {
        if (value == null) {
          return 'Please select a food';
        }
      },
    );
  }

  Widget _frequencyField(FoodModel model) {
    return DropdownButtonFormField(
      decoration: InputDecoration(labelText: 'How often do you have it?'),
      items: DropdownFactory.buildFrequencyItems(model.frequencies),
      value: model.selectedFrequency,
      onChanged: _setSelectedFrequency,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please choose how often you eat that food';
        }
      },
    );
  }

  Widget _submitButton() {
    return RaisedButton(
      onPressed: () {
        if (_formKey.currentState.validate()) {
          // If the form is valid, display a snackbar. In the real world, you'd
          // often want to call a server or save the information in a database
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Loading...'),
            duration: Duration(milliseconds: 500),
          ));
          _submitCallback();
        }
      },
      child: Text('Find out'),
    );
  }

  void _setSelectedFood(Food value) {
    ScopedModel.of<FoodModel>(context).selectedFood = value;
  }

  void _setSelectedFrequency(Frequency value) {
    ScopedModel.of<FoodModel>(context).selectedFrequency = value;
  }
}
