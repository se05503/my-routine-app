import 'dart:ui';

class HabitItem {
  String title;
  String imagePath;
  Set<DateTime> status; // 메모리 절약을 위해 습관을 완료한 DateTime만 담음 + 3개 이상의 상태(enum) 관리 시 Map<DateTime, HabitStatus>로 변경 필요
  Color color;

  HabitItem({
    required this.title,
    required this.imagePath,
    required this.status,
    required this.color,
  });
}
