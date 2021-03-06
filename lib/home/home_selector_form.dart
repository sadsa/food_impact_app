import 'package:flutter/material.dart';
import 'package:food_impact_app/entities/food.dart';
import 'package:food_impact_app/entities/frequency.dart';
import 'package:food_impact_app/main.dart';
import 'package:food_impact_app/models/food_model.dart';
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
        builder: (context, child, model) => Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: <Widget>[
                _foodField(model),
                _frequencyField(model),
                _submitButton()
              ],
            )),
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
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: RaisedButton(
          onPressed: () {
            if (_formKey.currentState.validate()) {
              _submitCallback();
            }
          },
          child: Text(
            'Find out',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          color: AppColorPalette.teal,
          textColor: Colors.white,
        ));
  }

  void _setSelectedFood(Food value) {
    ScopedModel.of<FoodModel>(context).foodChoice = value;
  }

  void _setSelectedFrequency(Frequency value) {
    ScopedModel.of<FoodModel>(context).frequencyChoice = value;
  }
}
