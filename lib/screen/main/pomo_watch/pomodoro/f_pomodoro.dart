import 'package:flutter/material.dart';

class PomodoroFragment extends StatefulWidget {
  const PomodoroFragment({super.key});

  @override
  State<PomodoroFragment> createState() => _PomodoroFragmentState();
}

class _PomodoroFragmentState extends State<PomodoroFragment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [Text("할일 선택"), Icon(Icons.keyboard_arrow_right_rounded)],
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 250,
              height: 250,
              child: CircularProgressIndicator(
                value: 1.0,
                strokeWidth: 10,
                color: Colors.grey[300],
              ),
            ),
            SizedBox(
              width: 250,
              height: 250,
              child: CircularProgressIndicator(
                value: 0.7,
                strokeWidth: 10,
                color: Colors.blue,
                strokeCap: StrokeCap.round,
              ),
            ),
            const Text(
              "60:00",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.play_circle_fill_rounded),
              iconSize: 40,
            ),
            SizedBox(width: 20,),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.stop_circle_rounded),
              iconSize: 40,
            ),
          ],
        ),
      ],
    );
  }
}
