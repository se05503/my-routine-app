import 'package:flutter/material.dart';

class HabitDailyItem extends StatefulWidget {
  final String title;
  final String imagePath;
  final bool status;
  final Color color;

  const HabitDailyItem({
    super.key,
    required this.title,
    required this.imagePath,
    required this.status,
    required this.color,
  });

  @override
  State<HabitDailyItem> createState() => _HabitDailyItemState();
}

class _HabitDailyItemState extends State<HabitDailyItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: widget.color,
            backgroundImage: AssetImage(widget.imagePath),
          ),
          SizedBox(width: 8),
          Expanded(child: Text(widget.title)),
          Text(widget.status ? "완료" : "미완료"),
        ],
      ),
    );
  }
}
