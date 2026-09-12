import 'package:flutter/material.dart';
import 'package:my_routine_app/screen/widget/w_habit_monthly_item.dart';

import '../../data/memory/vo_habit.dart';

class HabitMonthlyHistory extends StatefulWidget {
  final List<HabitItem> habitList;
  const HabitMonthlyHistory({super.key, required this.habitList});

  @override
  State<HabitMonthlyHistory> createState() => _HabitMonthlyHistoryState();
}

class _HabitMonthlyHistoryState extends State<HabitMonthlyHistory> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 40,
        childAspectRatio: 2
      ),
      itemCount: widget.habitCount,
      itemBuilder: (context, index) {
        return MonthlyHabitItem();
      },
    );
  }
}
