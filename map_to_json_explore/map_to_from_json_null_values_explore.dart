import 'dart:convert';
import 'dart:io';

/// Explore how to handle null values in json.
void main() async {
  Map<String, dynamic> mapToStoreInJsonFile = {
    'one': 1,
    'two': 'deux',
    'three': 'drei',
    'five': null, // adding a null value in the Map to store in a json file
  };

  Directory current = Directory.current;
  String sep = Platform.pathSeparator;
  String currentPathStr = '${current.path}${sep}map_to_json_explore';
  String jsonTestFilePath =
      '$currentPathStr${Platform.pathSeparator}test_null.json';

  String mapOneJsonStr = json.encode(mapToStoreInJsonFile);

  final File file = File(jsonTestFilePath);
  file.writeAsStringSync(mapOneJsonStr);

  String loadedJsonStr = await file.readAsString();
  Map<String, dynamic> jsonResponse = jsonDecode(loadedJsonStr);

  Map<String, dynamic> mapLoadedFromJsonFile = {
    'one': jsonResponse['one'],
    'two': jsonResponse['two'],
    'three': jsonResponse['three'],
    'four': jsonResponse['four'], // this key does not exist in the json file
    'five': jsonResponse['five'], // this key exists in the json file, but its
                                  // value is null
  };

  print(mapLoadedFromJsonFile);
}
