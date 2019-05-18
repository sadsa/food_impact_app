import 'package:food_impact_app/config/sentences.dart';
import 'package:food_impact_app/entities/sentence.dart';

class Food {
  final int key;
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
    landUse = data['land_use'] != null ? double.parse(data['land_use']) : 0;
    waterUse = data['water_use'] != null ? double.parse(data['water_use']) : 0;
    foodGroup = data['food_group'] != null ? data['food_group'] : '';
    sentences = data['sentences'] != null ? data['sentences'] : '';
    avgServingsGlobal = data['average_servings_global'] != null
        ? double.parse(data['average_servings_global'])
        : 0;
    avgServingsUk = data['average_servings_uk'] != null
        ? double.parse(data['average_servings_uk'])
        : 0;
  }

  List<Sentence> getSentences() {
    List<String> keys = sentences.split(', ');
    return keys
        .map((k) => Sentences.containsKey(k) ? Sentences[k] : null)
        .toList();
  }
}
