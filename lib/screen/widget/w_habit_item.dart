import 'package:flutter/material.dart';

class HabitItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final List<bool> status;
  final Color habitColor;

  const HabitItem({
    super.key,
    required this.title,
    required this.imagePath,
    required this.status,
    required this.habitColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          // 습관 정보 영역
          Expanded(
            flex: 3,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: habitColor,
                  backgroundImage: AssetImage(imagePath),
                ),
                SizedBox(width: 8),
                Text(title),
              ],
            ),
          ),
          // 일주일 습관 달성 상태 영역
          Expanded(
            flex: 7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(7, (index) {
                bool isDone = status[index];
                return Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: isDone ? habitColor : Colors.grey[200],
                    borderRadius: BorderRadius.circular(6),
                    // border: isDone ? null : Border.all(color: Colors.grey),
                  ),
                  // child: isDone ? null : Icon(Icons.close, size: 20),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
