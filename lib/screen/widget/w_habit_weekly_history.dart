import 'package:flutter/material.dart';
import 'package:my_routine_app/common/datetime_extension.dart';
import 'package:my_routine_app/screen/widget/w_habit_item.dart';

class HabitWeeklyHistory extends StatefulWidget {
  const HabitWeeklyHistory({super.key});

  @override
  State<HabitWeeklyHistory> createState() => _HabitWeeklyHistoryState();
}

class _HabitWeeklyHistoryState extends State<HabitWeeklyHistory> {
  DateTime baseDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.surface
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    baseDate = baseDate.subtract(Duration(days: 7));
                  });
                },
                child: const Icon(Icons.chevron_left_rounded),
              ),
              Text("${baseDate.firstDayOfWeek} ~ ${baseDate.lastDayOfWeek}"),
              InkWell(
                onTap: () {
                  setState(() {
                    baseDate = baseDate.add(Duration(days: 7));
                  });
                },
                child: const Icon(Icons.chevron_right_rounded),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Spacer(flex: 3),
              Expanded(
                flex: 7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      alignment: Alignment.center,
                      child: Text("월"),
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      alignment: Alignment.center,
                      child: Text("화"),
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      alignment: Alignment.center,
                      child: Text("수"),
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      alignment: Alignment.center,
                      child: Text("목"),
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      alignment: Alignment.center,
                      child: Text("금"),
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      alignment: Alignment.center,
                      child: Text("토"),
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      alignment: Alignment.center,
                      child: Text("일"),
                    ),
                  ],
                ),
              ),
            ],
          ),
          HabitItem(
            title: "산책하기",
            imagePath: "assets/image/habit_stroll.png",
            habitColor: Colors.green.shade300,
            status: [true, true, false, true, false, true, true],
          ),
          HabitItem(
            title: "일기쓰기",
            imagePath: "assets/image/habit_diary.png",
            habitColor: Colors.orange.shade300,
            status: [true, true, false, false, false, true, false],
          ),
          HabitItem(
            title: "책 읽기",
            imagePath: "assets/image/habit_book.png",
            habitColor: Colors.blue.shade300,
            status: [true, false, false, false, false, true, true],
          ),
        ],
      ),
    );
  }
}
