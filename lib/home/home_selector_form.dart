import 'package:flutter/material.dart';
import 'package:food_impact_app/food.dart';
import 'package:food_impact_app/food_model.dart';
import 'package:food_impact_app/frequency.dart';
import 'package:food_impact_app/util/dropdown_factory.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeSelectorForm extends StatefulWidget {
  final Function _submitCallback;

  HomeSelectorForm(this._submitCallback);

  @override
  HomeSelectorFormState createState() {
    return HomeSelectorFormState(_submitCallback);
  }
}

class HomeSelectorFormState extends State<HomeSelectorForm> {
  final _formKey = GlobalKey<FormState>();
  final _submitCallback;
  final _autovalidate = false;

  HomeSelectorFormState(this._submitCallback);

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
      value: model.foodChoice,
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
      value: model.frequencyChoice,
      onChanged: _setSelectedFrequency,
      validator: (value) {
        if (value == null) {
          return 'Please choose how often you eat that food';
        }
      },
    );
  }

  Widget _submitButton() {
    return RaisedButton(
      onPressed: () {
        if (_formKey.currentState.validate()) {
          _submitCallback();
        }
      },
      child: Text('Find out'),
    );
  }

  void _setSelectedFood(Food value) {
    ScopedModel.of<FoodModel>(context).foodChoice = value;
  }

  void _setSelectedFrequency(Frequency value) {
    ScopedModel.of<FoodModel>(context).frequencyChoice = value;
  }
}
