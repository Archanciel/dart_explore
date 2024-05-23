import 'dart:convert';
import 'dart:io';

/// Replaces text in all JSON files within a directory and its subdirectories.
///
/// [sourceDir] is the root directory to start the search.
/// [searchText] is the text to be replaced.
/// [replaceText] is the new text to replace the search text.
Future<void> replaceTextInJsonFiles(
    String sourceDir, String searchText, String replaceText) async {
  final directory = Directory(sourceDir);

  if (!directory.existsSync()) {
    print('The source directory does not exist');
    return;
  }

  // Traverse the directory and its subdirectories
  await for (var entity
      in directory.list(recursive: true, followLinks: false)) {
    if (entity is File && entity.path.endsWith('.json')) {
      await _replaceTextInFile(entity, searchText, replaceText);
    }
  }
}

/// Replaces text in a single JSON file.
///
/// [file] is the JSON file to process.
/// [searchText] is the text to be replaced.
/// [replaceText] is the new text to replace the search text.
Future<void> _replaceTextInFile(
    File file, String searchText, String replaceText) async {
  try {
    final content = await file.readAsString();
    final Map<String, dynamic> jsonContent = jsonDecode(content);

    final updatedJsonContent =
        _replaceTextInMap(jsonContent, searchText, replaceText);
    final updatedContent = jsonEncode(updatedJsonContent);

    await file.writeAsString(updatedContent);
    print('Updated file: ${file.path}');
  } catch (e) {
    print('Error processing file ${file.path}: $e');
  }
}

/// Recursively replaces text in a JSON map.
///
/// [jsonMap] is the JSON map to process.
/// [searchText] is the text to be replaced.
/// [replaceText] is the new text to replace the search text.
Map<String, dynamic> _replaceTextInMap(
    Map<String, dynamic> jsonMap, String searchText, String replaceText) {
  final updatedMap = <String, dynamic>{};

  jsonMap.forEach((key, value) {
    if (value is String) {
      updatedMap[key] = value.replaceAll(searchText, replaceText);
    } else if (value is Map) {
      updatedMap[key] = _replaceTextInMap(
          value.cast<String, dynamic>(), searchText, replaceText);
    } else if (value is List) {
      updatedMap[key] = _replaceTextInList(value, searchText, replaceText);
    } else {
      updatedMap[key] = value;
    }
  });

  return updatedMap;
}

/// Recursively replaces text in a JSON list.
///
/// [jsonList] is the JSON list to process.
/// [searchText] is the text to be replaced.
/// [replaceText] is the new text to replace the search text.
List<dynamic> _replaceTextInList(
    List<dynamic> jsonList, String searchText, String replaceText) {
  return jsonList.map((element) {
    if (element is String) {
      return element.replaceAll(searchText, replaceText);
    } else if (element is Map) {
      return _replaceTextInMap(
          element.cast<String, dynamic>(), searchText, replaceText);
    } else if (element is List) {
      return _replaceTextInList(element, searchText, replaceText);
    } else {
      return element;
    }
  }).toList();
}

void main() async {
  const String kDownloadAppTestSavedDataDir =
      "C:\\Users\\Jean-Pierre\\Development\\Flutter\\audiolearn\\test\\data\\saved";

  const String kApplicationPathWindows =
      "C:\\Users\\Jean-Pierre\\Development\\Flutter\\audiolearn\\test\\data\\audio";

  const sourceDir = kDownloadAppTestSavedDataDir;
  const searchText =
      "C:\\Users\\Jean-Pierre\\Downloads\\Audio";
  const replaceText = kApplicationPathWindows;

  await replaceTextInJsonFiles(sourceDir, searchText, replaceText);
}
