import 'package:flutter/material.dart';
import 'package:my_routine_app/screen/widget/w_habit_daily_item.dart';
import '../../common/datetime_extension.dart';
import '../../data/memory/vo_habit.dart';

class HabitDailyHistory extends StatefulWidget {
  final List<HabitItem> habitList;

  const HabitDailyHistory(this.habitList, {super.key});

  @override
  State<HabitDailyHistory> createState() => _HabitDailyHistoryState();
}

class _HabitDailyHistoryState extends State<HabitDailyHistory> {
  DateTime baseDate = DateTime.now().onlyDate;

  @override
  Widget build(BuildContext context) {
    DateTime firstDayOfWeek = baseDate.subtract(
      Duration(days: baseDate.weekday - 1),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.surface,
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ["월", "화", "수", "목", "금", "토", "일"].map((day) {
              return Container(
                width: 20,
                height: 20,
                alignment: Alignment.center,
                child: Text(day),
              );
            }).toList(),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(7, (index) {
              final day = firstDayOfWeek.add(Duration(days: index)).day;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    baseDate = DateTime(baseDate.year, baseDate.month, day);
                  });
                },
                child: Container(
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                  decoration: day == baseDate.day ? BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(12)) : null,
                  child: Text(
                    day.toString(),
                  ),
                ),
              );
            }),
          ),
          ...widget.habitList.map(
            (habitItem) => HabitDailyItem(
              title: habitItem.title,
              imagePath: habitItem.imagePath,
              color: habitItem.color,
              status: habitItem.status.contains(baseDate),
            ),
          ),
        ],
      ),
    );
  }
}
