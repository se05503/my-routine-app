import 'package:flutter/material.dart';
import 'package:my_routine_app/screen/main/pomo_watch/pomodoro/f_pomodoro.dart';
import 'package:my_routine_app/screen/main/pomo_watch/stopwatch/f_stopwatch.dart';

class PomoWatchFragment extends StatefulWidget {
  const PomoWatchFragment({super.key});

  @override
  State<PomoWatchFragment> createState() => _PomoWatchFragmentState();
}

class _PomoWatchFragmentState extends State<PomoWatchFragment> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("포모워치"),
          bottom: const TabBar(
            tabs: [
              Tab(text: '포모도로'),
              Tab(text: '스톱워치'),
            ],
            indicatorColor: Colors.blue,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
          ),
        ),
        body: const TabBarView(
          children: [PomodoroFragment(), StopwatchFragment()],
        ),
      ),
    );
  }
}
