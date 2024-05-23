import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  const originalFilePath = "C:\\Users\\Jean-Pierre\\Development\\Flutter\\audiolearn\\lib\\l10n\\app_en.arb";
  const correctedFilePath = "C:\\Users\\Jean-Pierre\\Development\\Flutter\\audiolearn\\lib\\l10n\\corrected_tooltips_en.arb";
  const outputFilePath = "C:\\Users\\Jean-Pierre\\Development\\Flutter\\audiolearn\\lib\\l10n\\updated_original_en.arb";

  // Read the original and corrected ARB files
  final originalFile = File(originalFilePath);
  final correctedFile = File(correctedFilePath);

  if (!await originalFile.exists() || !await correctedFile.exists()) {
    print('One or both of the ARB files do not exist.');
    return;
  }

  final originalContent = await originalFile.readAsString();
  final correctedContent = await correctedFile.readAsString();

  final Map<String, dynamic> originalJson = jsonDecode(originalContent);
  final Map<String, dynamic> correctedJson = jsonDecode(correctedContent);

  // Replace tooltips in the original ARB file with those in the corrected ARB file
  correctedJson.forEach((key, value) {
    if (key.contains('Tooltip')) {
      originalJson[key] = value;
    }
  });

  // Write the updated content back to the original ARB file
  final updatedContent = JsonEncoder.withIndent('  ').convert(originalJson);
  await File(outputFilePath).writeAsString(updatedContent);

  print('Tooltips have been updated in the original ARB file.');
}
