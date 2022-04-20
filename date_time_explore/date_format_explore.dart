// https://api.dart.dev/stable/2.16.2/dart-core/DateTime-class.html
// https://medium.com/flutter-community/working-with-dates-in-dart-e81c70911811

import 'dart:io';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() {
  final String localeName =
      Platform.localeName; // Returns locale string in the form 'fr-CH'
  print(localeName); // fr-CH

  DateFormat defaultNotLocalDf = DateFormat();
  final DateTime dateNow = DateTime.now();
  String dateString = defaultNotLocalDf.format(dateNow);
  print('using defaultNotLocalDf: ${dateString}'); // April 20, 2022 1:33:03 AM

  final specifiedNotLocalDf = DateFormat("dd-MM-yyyy HH:mm");
  dateString = specifiedNotLocalDf.format(dateNow);
  print('using specifiedNotLocalDf: $dateString'); // 20-04-2022 01:33

  final DateTime date = specifiedNotLocalDf.parse(dateString);
  print('default date time format: $date'); // 2022-04-20 01:41:00.000

  final dateFormatEEEENotLocal = DateFormat("EEEE dd-MM-yyyy HH:mm");
  dateString = dateFormatEEEENotLocal.format(date);
  print('dateFormatEEEENotLocal: $dateString'); // Wednesday 20-04-2022 01:41

  initializeDateFormatting(localeName); // required to avoid exception below
// LocaleDataException: Locale data has not been initialized, call
// initializeDateFormatting(<locale>) thrown on next expression
  final dateFormatEEEELocal = DateFormat("EEEE dd-MM-yyyy HH:mm", localeName);
  dateString = dateFormatEEEELocal.format(date);
  print('dateFormatEEEELocal: $dateString'); // mercredi 20-04-2022 01:41

  final DateFormat dateTimeFormat_yMMMMEEEEd_local =
      DateFormat.yMMMMEEEEd(localeName);
  dateString = dateTimeFormat_yMMMMEEEEd_local.format(date);
  print('yMMMMEEEEd local format: $dateString'); // mercredi, 20 avril 2022

  final DateFormat withHHmmLocalDf = dateTimeFormat_yMMMMEEEEd_local.add_Hm();
  dateString = withHHmmLocalDf.format(date);
  print('withHHmmLocalDf format: $dateString'); // mercredi, 20 avril 2022 01:57

  String dayOfWeek = DateFormat.EEEE(localeName).format(dateNow);
  print('dayOfWeek: $dayOfWeek'); // mercredi

  String dayMonth = DateFormat.MMMMd(localeName).format(dateNow);
  print('dayMonth: $dayMonth'); // 20 avril

  String year = DateFormat.y(localeName).format(dateNow);
  print('year: $year'); // 2022

  DateTime hhmm = DateFormat.jm(localeName).parse('13:23');
  print('${hhmm.hour} : ${hhmm.minute}'); // 13 : 23

  hhmm = DateFormat.jm(localeName).parse('13:03');
  print('${hhmm.hour} : ${hhmm.minute}'); // 13 : 3

  NumberFormat nbf = NumberFormat('00');
  int val = 3;
  print('${nbf.format(val)}'); // 03
  print('${hhmm.hour}:${nbf.format(hhmm.minute)}'); // 13:03
}
