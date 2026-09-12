import 'package:flutter/material.dart';

class MonthlyHabitItem extends StatelessWidget {
  final Color habitColor;
  final Icon habitIcon;
  final String habitName;
  final List<bool> habitStatus;
  final int dayOfMonth;

  const MonthlyHabitItem({
    super.key,
    required this.habitColor,
    required this.habitIcon,
    required this.habitName,
    required this.dayOfMonth, required this.habitStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(backgroundColor: habitColor, child: habitIcon),
            SizedBox(width: 4),
            Text(habitName),
          ],
        ),
        SizedBox(height: 8),
        GridView.count(
          crossAxisCount: 7,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: List.generate(dayOfMonth, (index) {
            return Container(
              decoration: BoxDecoration(
                color: habitStatus[index] ? habitColor : Colors.grey[200]
              ),
            );
          }),
        ),
      ],
    );
  }
}
