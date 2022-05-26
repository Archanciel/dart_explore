import 'dart:convert';

void main() {
  try {
    Map<String, dynamic> map = {
      'calcSlDurNewDateTimeStr': '23-05-2022 06:57',
      'calcSlDurPreviousDateTimeStr': '23-05-2022 06:57',
      'calcSlDurCurrSleepDurationStr': '4:10',
      'calcSlDurCurrWakeUpDurationStr': '0:30',
      'calcSlDurStatus': 'status.wakeUp',
      'calcSlDurSleepTimeStrHistory': ['23-05-2022 02:17', '4:00', '0:10'],
      'calcSlDurWakeUpTimeStrHistory': ['23-05-2022 06:17', '0:30'],
      'firstTimeStr': '00:00:30',
      'secondTimeStr': '00:00:50',
      'resultTimeStr': '00:01:20',
      'dtDiffStartDateTimeStr': '2022-05-23 12:33',
      'dtDiffEndDateTimeStr': '2022-05-23 22:33:42.674540',
      'dtDiffDurationStr': '10:00',
      'dtDiffAddTimeStr': '',
      'dtDiffFinalDurationStr': '',
      'durationIconData': 'IconData(U+0E516)',
      'durationIconColor': 'Color(0xffef9a9a)',
      'durationSign': -1,
      'durationTextColor': 'Color(0xffef9a9a)',
      'addDurStartDateTimeStr': '2022-05-23 22:34:02.405194',
      'durationStr': '00:09',
      'endDateTimeStr': '23-05-2022 22:25',
    };

    String str = json.encode(map);
    print(str);
  } catch (e) {
    print(e);
  }
}
