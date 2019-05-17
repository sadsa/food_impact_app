import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:food_impact_app/food.dart';

class FoodDataService {
  static Future<List<Food>> getFoodData() async {
    Completer<List<Food>> completer = new Completer<List<Food>>();

    FirebaseDatabase.instance
        .reference()
        .child("Foods")
        .once()
        .then((DataSnapshot snapshot) {
      List<dynamic> values = snapshot.value;
      var foods = new List<Food>();
      for (var i = 0; i < values.length; i++) {
        foods.add(new Food.fromJson(i, values[i]));
      }
      completer.complete(foods);
    });

    return completer.future;
  }
}
