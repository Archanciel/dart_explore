import 'package:intl/intl.dart';

// adding method HHmm which returns the Duration formatted as HH:mm
extension on Duration {  // When you use your extension in another file,
//                          you must give it a name !
  static final NumberFormat numberFormat = NumberFormat('00');

  /// returns the Duration formatted as HH:mm
  String HHmm() {
    final int durationMinute = this.inMinutes.remainder(60);

    return "${numberFormat.format(this.inHours)}:${numberFormat.format(durationMinute)}";
  }
}

void main() {
  Duration dur = Duration(minutes: 58);

  for (int i = 0; i < 3; i++) {
    dur = dur + Duration(minutes: 1);
    print(dur.HHmm());
  }
}
