import 'package:flutter/material.dart';
import 'package:my_routine_app/data/memory/todo_holder.dart';
import 'package:my_routine_app/screen/main/s_main.dart';

import 'data/memory/todo_notifier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final notifier = TodoNotifier();

  @override
  void dispose() {
    notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TodoHolder(
      notifier: notifier,
      child: MaterialApp(
        title: '마이루틴',
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

