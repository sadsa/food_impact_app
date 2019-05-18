import 'package:sprintf/sprintf.dart';
import 'package:intl/intl.dart';

class TokenFormatter {
  static List<String> formatList(List<double> tokenValues) {
    return tokenValues.map((value) => format(value)).toList();
  }

  static String format(double value) {
    int rounded = value.round();
    var f = new NumberFormat.decimalPattern();
    return f.format(rounded);
  }

  static String replace(String text, List<dynamic> values) {
    return sprintf(text, values);
  }

  // static String tokenReplace(String template, List<String> replacements) {
  //   RegExp exp = new RegExp(r"{{([^{}]*)}}");
  //   replacements.forEach((String str) {
  //     template = template.replaceFirstMapped(
  //         exp, (Match m) => "${m[1].isNotEmpty ? str : ''}");
  //   });
  //   return template;
  // }
}
