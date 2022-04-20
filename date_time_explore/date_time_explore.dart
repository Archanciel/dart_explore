import 'dart:io';

import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

// adding method HHmm which returns the Duration formatted as HH:mm 
extension on Duration {
  static final NumberFormat numberFormat = NumberFormat('00');

  /// returns the Duration formatted as HH:mm
  String HHmm() {
    final int durationMinute = this.inMinutes.remainder(60);
    return "${numberFormat.format(this.inHours)}:${numberFormat.format(durationMinute)}";
  }
}

void main() {
  const Duration onBedDuration = Duration(hours: 13, minutes: 15);
  const Duration wakeDuration = Duration(hours: 24);
  final Duration duration = onBedDuration + wakeDuration;
  final String dutationStr = duration.HHmm();

  Duration dur = Duration(minutes: 58);

  print('validating that Duration.inHours ignores the duration minutes');

  for (int i = 0; i < 3; i++) {
    dur = dur + Duration(minutes: 1);
    print(dur.HHmm());
  }

  print('');

  final String localName = Platform.localeName;
  initializeDateFormatting(localName);
  final DateFormat localDdateFormat = DateFormat('dd-MM-yyyy HH:mm', localName);
  final DateFormat localDateFormatDayName =
      DateFormat("EEEE dd-MM-yyyy HH:mm", localName);

  DateTime previousDate = localDdateFormat.parse('19-04-2022 15:30');
  String previousDateStr = localDateFormatDayName.format(previousDate);
  String nextDateStr = '';
  print('planified wake up time: $previousDateStr');

  for (int i = 0; i < 3; i++) {
    final DateTime nextDate = previousDate.subtract(duration);
    nextDateStr = localDateFormatDayName.format(nextDate);
    print('$previousDateStr - $dutationStr = $nextDateStr');
    previousDate = nextDate;
    previousDateStr = localDateFormatDayName.format(previousDate);
  }
}
