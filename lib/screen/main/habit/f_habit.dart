import 'package:flutter/material.dart';

import '../../widget/w_habit_weekly_history.dart';

class HabitFragment extends StatefulWidget {
  const HabitFragment({super.key});

  @override
  State<HabitFragment> createState() => _HabitFragmentState();
}

class _HabitFragmentState extends State<HabitFragment> {
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
          HabitWeeklyHistory()
          // 월간 습관 히스토리
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
