import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_routine_app/screen/widget/w_habit_monthly_item.dart';
import '../../common/datetime_extension.dart';
import '../../data/memory/vo_habit.dart';

class HabitMonthlyHistory extends StatefulWidget {
  final List<HabitItem> habitList;

  const HabitMonthlyHistory(this.habitList, {super.key});

  @override
  State<HabitMonthlyHistory> createState() => _HabitMonthlyHistoryState();
}

class _HabitMonthlyHistoryState extends State<HabitMonthlyHistory> {
  DateTime baseDate = DateTime
      .now()
      .onlyDate;
  final TextEditingController _monthlyReflectionController = TextEditingController();

  // 월간 데이터를 추출하는 함수
  List<bool> getMonthlyStatus(Set<DateTime> totalStatus, DateTime baseDate) {
    DateTime firstDayOfMonth = DateTime(
      baseDate.year,
      baseDate.month,
      1,
    ); // 달의 첫번째 날
    int totalDays = DateTime(
      baseDate.year,
      baseDate.month + 1,
      0,
    ).day; // 달의 마지막 일 = 다음달의 0일

    return List.generate(totalDays, (index) {
      DateTime date = firstDayOfMonth.add(
        Duration(days: index),
      ); // 1일 ~ 달의 마지막 일
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
                    baseDate = DateTime(
                      baseDate.year,
                      baseDate.month - 1,
                      baseDate.day,
                    );
                  });
                },
                child: const Icon(Icons.chevron_left_rounded),
              ),
              Text("${baseDate.month}월"),
              InkWell(
                onTap: () {
                  setState(() {
                    baseDate = DateTime(
                      baseDate.year,
                      baseDate.month + 1,
                      baseDate.day,
                    );
                  });
                },
                child: const Icon(Icons.chevron_right_rounded),
              ),
            ],
          ),
          SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 32,
              childAspectRatio: 1.08, // 여백 안남는 비율
            ),
            itemCount: widget.habitList.length,
            itemBuilder: (context, index) {
              return MonthlyHabitItem(
                title: widget.habitList[index].title,
                imagePath: widget.habitList[index].imagePath,
                color: widget.habitList[index].color,
                status: getMonthlyStatus(widget.habitList[index].status, baseDate),
              );
            },
          ),
          SizedBox(height: 12),
          TextField(
            controller: _monthlyReflectionController,
            decoration: InputDecoration(
                hintText: "이번달의 성찰 일지를 작성해보세요",
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
