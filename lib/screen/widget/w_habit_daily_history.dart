import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
  final TextEditingController _dailyReflectionController =
      TextEditingController();

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
                  decoration: day == baseDate.day
                      ? BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(12),
                        )
                      : null,
                  child: Text(day.toString()),
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
          SizedBox(height: 12),
          TextField(
            controller: _dailyReflectionController,
            // onSubmitted: (content) {
            //   저장하기
            // },
            decoration: InputDecoration(
              hintText: "오늘의 성찰 일지를 작성해보세요",
              hintStyle: TextStyle(color: Colors.grey.shade400),
              // 배경색을 채울 것인지 유무
              filled: true,
              // 배경색 색상
              fillColor: Colors.grey[200],
              // 기본 밑줄 제거
              border: InputBorder.none,
              // 둥근 모서리 - 포커스 전 기본 상태
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none, // 테두리 선 제거
              ),
              // 둥근 모서리 - 포커스 된 상태
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none, // 테두리 선 제거
              ),
              // contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
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
              // isCollapsed: true,
              isDense: true
            ),
            style: TextStyle(color: Colors.black),
            maxLines: null, // 글자 수에 따라 입력창의 높이가 무한히 늘어남
          ),
        ],
      ),
    );
  }
}
