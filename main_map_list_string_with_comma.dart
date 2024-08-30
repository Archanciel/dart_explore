import 'dart:convert';

void main() {
  final Map<String, List<String>> dataMap = {
    "one": ["S8 audio", "Name, with comma"]
  };

  final Map<String, dynamic> mapWithComma = dataMap.map(
      (subKey, subValue) => MapEntry(subKey.toString(), jsonEncode(subValue)));

  print(mapWithComma);

  // // final Map<String, List<String>> mapWithoutComma = mapWithComma.map(
  // //     (subKey, subValue) =>
  // //         MapEntry(subKey.toString(), jsonDecode(subValue.toString()) as String));

  // print(mapWithoutComma);
}
