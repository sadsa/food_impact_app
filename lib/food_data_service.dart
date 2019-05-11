import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:food_impact_app/food.dart';

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
