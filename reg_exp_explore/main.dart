void main() {
  final List<String> dateTimeStrLst = [
    '14-12 13:35',
    '4-2 3:05',
    'a4-2 3:05',
    '14-2 3:u5',
    '14-2 3:5',
  ];
  final RegExp regExp = RegExp(r'^(\d+-\d+)\s(\d+:\d{2})');

  for (String str in dateTimeStrLst) {
    var match = regExp.firstMatch(str);
    String? dayMonth = match?.group(1);
    String? hourMinute = match?.group(2);
    print('$str: $dayMonth $hourMinute');
  }
}
