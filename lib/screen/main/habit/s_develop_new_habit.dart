import 'package:flutter/material.dart';
import 'package:my_routine_app/screen/widget/w_rounded_container.dart';

class DevelopNewHabitScreen extends StatefulWidget {
  const DevelopNewHabitScreen({super.key});

  @override
  State<DevelopNewHabitScreen> createState() => _DevelopNewHabitScreenState();
}

class _DevelopNewHabitScreenState extends State<DevelopNewHabitScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        // Navigator.push로 들어온 화면일 경우 자동으로 뒤로가기 화살표를 생성해준다.
        // 만약 수동으로 아이콘을 지정하고 싶다면 leading 속성을 사용한다.
        title: Text("새로운 습관"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // 자식들을 가로로 꽉 채움
          children: [
            RoundedContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("이름"),
                  SizedBox(height: 8),
                  _buildTextField(
                    controller: _nameController,
                    hintText: "일찍 일어나기",
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            RoundedContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("설명"),
                  SizedBox(height: 8),
                  _buildTextField(
                    controller: _descriptionController,
                    hintText: "하루를 기분좋게 시작할 수 있어요",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 헬퍼 함수
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.shade400),
        filled: true,
        fillColor: Colors.grey[200],
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        isDense: true,
      ),
      style: TextStyle(color: Colors.black),
    );
  }
}
