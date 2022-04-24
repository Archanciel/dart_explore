import 'package:intl/intl.dart';

// adding method HHmm which returns the Duration formatted as HH:mm
extension FormattedHourMinute on Duration {
  static final NumberFormat numberFormatTwoInt = NumberFormat('00');

  /// returns the Duration formatted as HH:mm
  String HHmm() {
    int durationMinute = this.inMinutes.remainder(60);
    String minusStr = '';

    if (this.inMinutes < 0) {
      if (this.inHours == 0) {
        minusStr = '-';
      }
      durationMinute = -durationMinute;
    }

    return "$minusStr${this.inHours}:${numberFormatTwoInt.format(durationMinute)}";
  }
}

void main() {
  Duration dur = Duration(minutes: 58);

  for (int i = 0; i < 3; i++) {
    dur = dur + Duration(minutes: 1);
    print(dur.HHmm());
  }

  print((dur - Duration(hours: 1, minutes: 2)).HHmm());
  print(Duration(minutes: -5).HHmm());
  final Duration durationHoursOneDigit = Duration(hours: -1, minutes: -5);
  print(durationHoursOneDigit.HHmm());
  print(durationHoursOneDigit);
  final Duration durationHoursTwoDigits = Duration(hours: -12, minutes: -5);
  print(durationHoursTwoDigits.HHmm());
  print(durationHoursTwoDigits);
}
