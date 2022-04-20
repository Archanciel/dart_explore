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
  final String localName = Platform.localeName;
  initializeDateFormatting(localName);
  final DateFormat localDateFormat = DateFormat('dd-MM-yyyy HH:mm', localName);
  final DateFormat localDateFormatDayName =
      DateFormat("EEEE dd-MM-yyyy HH:mm", localName);

  const Duration onBedDurationUserInput = Duration(hours: 12, minutes: 30);
  final String onBedDurationStr = onBedDurationUserInput.HHmm();
  const Duration wakeDurationUserInput = Duration(hours: 18);
  final String wakeDurationStr = wakeDurationUserInput.HHmm();
  final Duration circadianDuration =
      onBedDurationUserInput + wakeDurationUserInput;
  final DateTime todayWakeUpDateUserInput =
      localDateFormat.parse('16-04-2022 21:00');
  final String todayWakeUpDateStr =
      localDateFormatDayName.format(todayWakeUpDateUserInput);

  final DateTime planifiedWakeUpTimeUserInput =
      localDateFormat.parse('19-04-2022 15:30');
  final String planifiedWakeUpTimeStr =
      localDateFormatDayName.format(planifiedWakeUpTimeUserInput);
  DateTime previousDate = planifiedWakeUpTimeUserInput;
  String previousDateStr = localDateFormatDayName.format(previousDate);
  String whenGoToBedStr = '';
  String whenWakeUpStr = '';
  DateTime beforeLimit;

  List<String> outputStringLst = [];

  while (true) {
    final DateTime whenGoToBed = previousDate.subtract(onBedDurationUserInput);
//    beforeLimit = previousDate.subtract(circadianDuration);

    if (whenGoToBed.isBefore(todayWakeUpDateUserInput)) {
      break;
    }

    previousDate = whenGoToBed;

    whenGoToBedStr = localDateFormatDayName.format(whenGoToBed);
    outputStringLst.add(
        'go to bed at: $whenGoToBedStr ($onBedDurationStr before next wake up)');
    final DateTime whenWakeUp = previousDate.subtract(wakeDurationUserInput);
    beforeLimit = previousDate.subtract(circadianDuration);

    if (beforeLimit.isBefore(todayWakeUpDateUserInput)) {
      previousDate = whenGoToBed;
      break;
    }

    previousDate = whenWakeUp;
    whenWakeUpStr = localDateFormatDayName.format(whenWakeUp);
    outputStringLst.add(
        'wake up at: $whenWakeUpStr ($wakeDurationStr before next go to bed)');
    previousDateStr = localDateFormatDayName.format(previousDate);
  }

  final Duration diffBeforeNextGoToBed =
      previousDate.difference(todayWakeUpDateUserInput);
  print(
      'today wake up time: $todayWakeUpDateStr ${diffBeforeNextGoToBed.HHmm()} before next go to bed');
  outputStringLst.reversed.forEach((element) => print(element));
  print('planified wake up time: $planifiedWakeUpTimeStr');
  print('  (circadian duration: ${circadianDuration.HHmm()})');
}
