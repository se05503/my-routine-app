import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:my_routine_app/data/memory/todo_holder.dart';
import 'package:my_routine_app/screen/main/s_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    Get.put(TodoDataHolder());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '마이루틴',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
