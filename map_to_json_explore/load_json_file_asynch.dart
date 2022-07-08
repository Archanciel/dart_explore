import 'dart:io';
import 'dart:convert';

void main() async {
//Future<void> main() async { // Future<void> not usefull !
  var scores = [
    {'name': 'John', 'score': 40},
    {'name': 'Lea', 'score': 80},
  ];

  String jsonTextEncoded = jsonEncode(scores);
  String jsonFilePathName = 'json.txt';
  File(jsonFilePathName).writeAsStringSync(jsonTextEncoded);
  print('$jsonTextEncoded saved in $jsonFilePathName');

  await File(jsonFilePathName)
      .readAsString()
      .then((fileContents) => json.decode(fileContents))
      .then((jsonData) {
    print(jsonData);
  });
}
