import 'package:flutter/material.dart';

class MonthlyHabitItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color color;
  final List<bool> status;

  const MonthlyHabitItem({
    super.key,
    required this.color,
    required this.imagePath,
    required this.title,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(radius: 12, backgroundColor: color, backgroundImage: AssetImage(imagePath)),
            SizedBox(width: 8),
            Text(title),
          ],
        ),
        SizedBox(height: 8),
        GridView.count(
          crossAxisCount: 7,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: List.generate(status.length, (index) {
            return Container(
              decoration: BoxDecoration(
                color: status[index] ? color : Colors.grey[200],
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        ),
      ],
    );
  }
}
