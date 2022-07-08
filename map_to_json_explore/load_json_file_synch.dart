import 'dart:io';
import 'dart:convert';

void main() {
  var scores = [
    {'name': 'John', 'score': 40},
    {'name': 'Lea', 'score': 80},
  ];

  String jsonTextEncoded = jsonEncode(scores);
  String jsonFilePathName = 'json.txt';
  File(jsonFilePathName).writeAsStringSync(jsonTextEncoded);
  print('$jsonTextEncoded saved in $jsonFilePathName');

  String jsonTextReadEncoded = File(jsonFilePathName).readAsStringSync();
  var jsonTextReadDecoded = jsonDecode(jsonTextReadEncoded);
  print(jsonTextReadEncoded);
  print(jsonTextReadDecoded);

  File(jsonFilePathName)
      .readAsString()
      .then((fileContents) => json.decode(fileContents))
      .then((jsonData) {
    print('coucou');
    print(jsonData);
  });
}
