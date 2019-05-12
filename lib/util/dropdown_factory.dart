import 'package:flutter/material.dart';
import 'package:food_impact_app/food.dart';

class DropdownFactory {
  static List<DropdownMenuItem<Food>> buildFoodItems(List<Food> items) {
    return items
        .map((item) => DropdownMenuItem(
              child: Text(item.name),
              value: item,
            ))
        .toList();
  }

  static List<DropdownMenuItem<String>> buildFrequencyItems(
      List<String> items) {
    return items
        .map((item) => DropdownMenuItem(
              child: Text(item),
              value: item,
            ))
        .toList();
  }
}