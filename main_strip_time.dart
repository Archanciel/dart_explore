
import 'package:intl/intl.dart';

void main() {
  DateTime dateTime = DateTime(2021, 1, 1, 15, 30);
  print('dateTime: $dateTime');
  print('stripTime(dateTime): ${stripTime(dateTime)}');
  print('truncateDateTimeToDay(dateTime): ${truncateDateTimeToDay(dateTime)}');
}

DateTime stripTime(DateTime dateTime) {
  return DateTime(dateTime.year, dateTime.month, dateTime.day);
}

DateFormat englishDateFormat = DateFormat("yyyy-MM-dd");

DateTime truncateDateTimeToDay(DateTime dateTime) {
    return englishDateFormat.parse(englishDateFormat.format(dateTime));
}
