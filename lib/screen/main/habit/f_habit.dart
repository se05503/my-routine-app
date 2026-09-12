import 'package:flutter/material.dart';
import '../../../data/memory/vo_habit.dart';
import '../../widget/w_habit_monthly_history.dart';
import '../../widget/w_habit_weekly_history.dart';

class HabitFragment extends StatefulWidget {
  const HabitFragment({super.key});

  @override
  State<HabitFragment> createState() => _HabitFragmentState();
}

class _HabitFragmentState extends State<HabitFragment> {

  final List<HabitItem> habitList = [
    HabitItem(
        title: "산책하기",
        imagePath: "assets/image/habit_stroll.png",
        status: {
          DateTime(2026, 08, 26),
          DateTime(2026, 08, 29),
          DateTime(2026, 09, 01),
          DateTime(2026, 09, 03),
          DateTime(2026, 09, 04),
          DateTime(2026, 09, 07),
          DateTime(2026, 09, 08),
          DateTime(2026, 09, 11),
          DateTime(2026, 09, 12),
        }, color: Colors.green.shade300
    ),
    HabitItem(
        title: "일기쓰기",
        imagePath: "assets/image/habit_diary.png",
        status: {
          DateTime(2026, 08, 28),
          DateTime(2026, 08, 30),
          DateTime(2026, 09, 04),
          DateTime(2026, 09, 07),
          DateTime(2026, 09, 08),
        }, color: Colors.orange.shade300
    ),
    HabitItem(
        title: "책 읽기",
        imagePath: "assets/image/habit_book.png",
        status: {
          DateTime(2026, 08, 22),
          DateTime(2026, 08, 31),
          DateTime(2026, 09, 01),
          DateTime(2026, 09, 02),
          DateTime(2026, 09, 03),
          DateTime(2026, 09, 06),
          DateTime(2026, 09, 09),
          DateTime(2026, 09, 12),
        }, color: Colors.green.shade300
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("습관")),
      backgroundColor: Color(0x7BA6C4FF),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          // 내가 가진 전체 습관들
          // 주간 습관 히스토리
          HabitWeeklyHistory(habitList),
          // 월간 습관 히스토리
          HabitMonthlyHistory(habitList)
          // 연간 습관 히스토리
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 습관 추가 다이얼로그 띄우기
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
