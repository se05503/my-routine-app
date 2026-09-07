import 'package:flutter/material.dart';
import 'package:my_routine_app/screen/main/pomo_watch//f_pomo_watch.dart';
import 'package:my_routine_app/screen/main/todo/f_todo.dart';
import 'habit/f_habit.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _screens = [TodoFragment(), HabitFragment(), PomoWatchFragment()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _screens[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note_outlined),
            label: "할일",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "습관"),
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: "포모워치"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
