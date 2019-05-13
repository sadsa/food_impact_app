import 'package:flutter/material.dart';
import 'package:food_impact_app/food.dart';
import 'package:food_impact_app/frequency.dart';

class DropdownFactory {
  static List<DropdownMenuItem<Food>> buildFoodItems(List<Food> items) {
    return items
        .map((item) => DropdownMenuItem(
              child: Text(item.name),
              value: item,
            ))
        .toList();
  }

  static List<DropdownMenuItem<Frequency>> buildFrequencyItems(
      List<Frequency> items) {
    return items
        .map((item) => DropdownMenuItem(
              child: Text(item.name),
              value: item,
            ))
        .toList();
  }
}