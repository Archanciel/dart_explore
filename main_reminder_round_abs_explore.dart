void main() {
  double intSeconds = 2;
  divisionReminderOnDouble(intSeconds);

  double doubleSeconds_1 = 2.49;
  divisionReminderOnDouble(doubleSeconds_1);

  double doubleSeconds_2 = 2.5;
  divisionReminderOnDouble(doubleSeconds_2);

  double doubleSeconds_3 = 2.51;
  divisionReminderOnDouble(doubleSeconds_3);

  Duration durationMilliseconds_1 = Duration(milliseconds: 4311);
  divisionReminderOnDuration(durationMilliseconds_1);

  Duration durationMilliseconds_2 = Duration(milliseconds: 54689);
  divisionReminderOnDuration(durationMilliseconds_2);
}

void divisionReminderOnDouble(double seconds) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');

  double secondsDivision = seconds / 60;
  double secondsDoubleReminder = seconds.remainder(60);
  int secondsIntRoundedReminder = seconds.remainder(60).round();
  double secondsDoubleAbsReminder = seconds.remainder(60).abs();

  print('\nseconds: $seconds');
  print('secondsDivision: $secondsDivision');
  print('secondsDoubleReminder: $secondsDoubleReminder');
  print('secondsIntRoundedReminder: $secondsIntRoundedReminder');
  print(
      'secondsIntRoundedReminder two digits: ${twoDigits(secondsIntRoundedReminder)}');
  print('secondsDoubleAbsReminder: $secondsDoubleAbsReminder');
}

void divisionReminderOnDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');

  int millisecondsIntRoundedReminder = duration.inMilliseconds.remainder(60000).round();
  int secondsIntAbsReminder = duration.inSeconds.remainder(60).abs();
  int secondsIntAbsRoundedReminder = (duration.inMilliseconds.remainder(60000).abs() / 1000).round();

  print('\nduration: $duration');
  print('millisecondsIntRoundedReminder: $millisecondsIntRoundedReminder');
  print('secondsIntAbsReminder: $secondsIntAbsReminder');
  print(
      'secondsIntAbsRoundedReminder two digits: ${twoDigits(secondsIntAbsRoundedReminder)}');
}
