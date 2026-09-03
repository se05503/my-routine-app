import 'package:intl/intl.dart';

extension DatetimeExtension on DateTime {
  String get formattedDate => DateFormat('yyyy년 MM월 dd일').format(this);

  String get relativeDate {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final target = DateTime(year, month, day);
    final diff = target.difference(today).inDays; // target - today
    if(diff<0) {
      return "기한 지남";
    } else if(diff == 0) {
      return "오늘까지";
    } else if(diff == 1) {
      return "내일까지";
    } else {
      return "$diff일 남음";
    }
  }
}