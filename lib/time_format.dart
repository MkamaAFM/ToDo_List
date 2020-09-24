enum WeekDays { Monday, Tuesday, Wednesday, Thursday, Friday, Saturday }
enum Months {
  January,
  February,
  Match,
  April,
  May,
  June,
  July,
  August,
  September,
  October,
  November,
  December
}

String dateFormat(DateTime time, {bool showWeekday = true}) =>
    '${showWeekday ? '${WeekDays.values[time.weekday - 1].toString().split('.').last}\t\t' : ''}'
    '${Months.values[time.month - 1].toString().split('.').last}'
    '\t${time.day},'
    '\t${time.year}';

String timeFormat(DateTime time) => '${time.hour}:${time.minute}';
