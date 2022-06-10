import 'dart:math';
import 'package:intl/intl.dart';

void main() {
  final DateFormat frenchDateTimeFormat = DateFormat("dd-MM-yyyy HH:mm");

  bool mostRecentFirst = Random().nextBool();
  List<DateTime> dtLst = [
    frenchDateTimeFormat.parse('01-06-2022 23:42'),
    frenchDateTimeFormat.parse('03-06-2022 23:42'),
    frenchDateTimeFormat.parse('03-06-2022 03:42'),
    frenchDateTimeFormat.parse('02-06-2022 23:42'),
  ];

  if (mostRecentFirst) {
    dtLst.sort(
        (a, b) => b.millisecondsSinceEpoch.compareTo(a.millisecondsSinceEpoch));
  } else {
    dtLst.sort(
        (a, b) => a.millisecondsSinceEpoch.compareTo(b.millisecondsSinceEpoch));
  }

  print('mostRecentFirst: $mostRecentFirst');
  print(dtLst); // [2022-06-03 23:42:00.000, 2022-06-03 03:42:00.000,
//                  2022-06-02 23:42:00.000, 2022-06-01 23:42:00.000] if
//                  mostRecentFirst == true or
//                 [2022-06-01 23:42:00.000, 2022-06-02 23:42:00.000,
//                  2022-06-03 03:42:00.000, 2022-06-03 23:42:00.000] if
//                  mostRecentFirst == false
}
