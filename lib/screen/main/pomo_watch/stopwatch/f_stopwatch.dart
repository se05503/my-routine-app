import 'package:flutter/material.dart';

import '../../../widget/w_dialog_select_todo.dart';
import '../../../widget/w_timer_painter.dart';

class StopwatchFragment extends StatefulWidget {
  const StopwatchFragment({super.key});

  @override
  State<StopwatchFragment> createState() => _StopwatchFragmentState();
}

class _StopwatchFragmentState extends State<StopwatchFragment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            showDialog(context: context, builder: (context) {
              return SelectTodoDialog();
            });
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [Text("할일 선택"), Icon(Icons.keyboard_arrow_right_rounded)],
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: const Size(250, 250),
              painter: TickTimerPainter(0.3),
            ),
            const Text(
              "00:00",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        FilledButton(
          onPressed: () {},
          style: FilledButton.styleFrom(
            backgroundColor: Colors.blue,
            minimumSize: Size(160, 50)
          ),
          child: Text("시작"),
        ),
      ],
    );
  }
}
