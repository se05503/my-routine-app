import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:my_routine_app/common/app_colors.dart';
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
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          primary: AppColors.lightPrimaryColor, // 앱의 주요 강조 색상
          onPrimary: AppColors.lightOnPrimaryColor, // 강조 색상 위에 표현되는 텍스트 색상
          surface: AppColors.lightSurfaceColor, // 카드, 다이얼로그 등의 배경 색상
          onSurface: AppColors.lightOnSurfaceColor, // 카드, 다이얼로그 배경에 올라가는 텍스트 색상
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.dark(
          primary: AppColors.darkPrimaryColor,
          onPrimary: AppColors.darkOnPrimaryColor,
          surface: AppColors.darkSurfaceColor,
          onSurface: AppColors.darkOnSurfaceColor
        ),
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}
