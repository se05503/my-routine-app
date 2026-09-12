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

  String get firstDayOfWeek {
    DateTime firstDayOfWeek = subtract(Duration(days: weekday - 1));
    return "${firstDayOfWeek.month}월 ${firstDayOfWeek.day}일";
  }

  String get lastDayOfWeek {
    DateTime lastDayOfWeek = add(Duration(days: 7 - weekday));
    return "${lastDayOfWeek.month}월 ${lastDayOfWeek.day}일";
  }

  // 시간, 분, 초를 제외한 년, 월, 일을 담는 DateTime
  DateTime get onlyDate => DateTime(year, month, day);
}