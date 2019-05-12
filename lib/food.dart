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
    servingSize = data['serving_size'] != null ? data['serving_size'] : '';
  }
}