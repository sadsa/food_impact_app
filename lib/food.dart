import 'package:food_impact_app/sentences.dart';

class Food {
  final String key;
  String name;
  String servingSize; //": "140g",
  double ghg; //": "1.876796141",
  double landUse; //": "1.158023151",
  double waterUse; //": "508.277153",
  String foodGroup; //": "Protein-rich foods",
  String sentences; //": "GHG_sentence_1, GHG_sentence_2, Water_sentence",
  double avgServingsGlobal; //": "0.369237436",
  double avgServingsUk; //": "0.390283225"

  Food.fromJson(this.key, Map data) {
    name = data['food'] != null ? data['food'] : '';
    servingSize = data['serving_size'] != null ? data['serving_size'] : '';
    ghg = data['ghg'] != null ? double.parse(data['ghg']) : 0;
    sentences = data['sentences'] != null ? data['sentences'] : '';
  }

  List<Sentence> getSentences() {
    List<String> keys = sentences.split(', ');
    return keys
        .map((k) => Sentences.containsKey(k) ? Sentences[k] : null)
        .toList();
  }
}
