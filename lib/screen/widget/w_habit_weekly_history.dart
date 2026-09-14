import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_routine_app/common/datetime_extension.dart';
import 'package:my_routine_app/data/memory/vo_habit.dart';
import 'package:my_routine_app/screen/widget/w_habit_weekly_item.dart';

class HabitWeeklyHistory extends StatefulWidget {
  final List<HabitItem> habitList;

  const HabitWeeklyHistory(this.habitList, {super.key});

  @override
  State<HabitWeeklyHistory> createState() => _HabitWeeklyHistoryState();
}

class _HabitWeeklyHistoryState extends State<HabitWeeklyHistory> {
  final TextEditingController _weeklyReflectionController = TextEditingController();
  DateTime baseDate = DateTime.now().onlyDate;

  // 주간 데이터를 추출하는 함수
  List<bool> getWeeklyStatus(Set<DateTime> totalStatus, DateTime baseDate) {
    DateTime monday = baseDate.subtract(Duration(days: baseDate.weekday - 1));
    return List.generate(7, (index) {
      DateTime date = monday.add(Duration(days: index)); // 월요일 ~ 일요일
      return totalStatus.contains(date);
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  children: ["월", "화", "수", "목", "금", "토", "일"].map((day) {
                    return Container(
                      width: 20,
                      height: 20,
                      alignment: Alignment.center,
                      child: Text(day),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          ...widget.habitList.map((habit) {
            return WeeklyHabitItem(
              title: habit.title,
              imagePath: habit.imagePath,
              status: getWeeklyStatus(habit.status, baseDate),
              color: habit.color,
            );
          }),
          SizedBox(height: 12),
          TextField(
            controller: _weeklyReflectionController,
            decoration: InputDecoration(
                hintText: "이번주의 성찰 일지를 작성해보세요",
                hintStyle: TextStyle(color: Colors.grey.shade400),
                filled: true,
                fillColor: Colors.grey[200],
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/icon/ic_send.svg",
                    colorFilter: ColorFilter.mode(
                      Colors.grey,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                isDense: true
            ),
            style: TextStyle(color: Colors.black),
            maxLines: null,
          ),
        ],
      ),
    );
  }
}
