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
  final TextEditingController _iconNameController = TextEditingController();
  final List<Color> colorPresets = [
    Colors.red.shade400,
    Colors.orange.shade400,
    Colors.amber.shade400,
    Colors.green.shade400,
    Colors.blue.shade400,
    Colors.purple.shade400
  ];
  Color? selectedColor;

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
            SizedBox(height: 16),
            RoundedContainer(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("아이콘 / 이미지"),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: selectedColor ?? Colors.transparent,
                        child: Image.network(
                          width: 30,
                          height: 30,
                          "https://img.icons8.com/color/96/yoga.png",
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.error);
                          },
                        ),
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text("선택된 아이콘"), Text("요가")],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: _iconNameController,
                    decoration: InputDecoration(
                      hintText: "아이콘 이름으로 검색 (예: 산책, 독서)",
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none, // 테두리 선 제거
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none, // 테두리 선 제거
                      ),
                      prefixIcon: Icon(Icons.search),
                      isDense: true,
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 8),
                  Text("색상"),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildNoneColorItem(),
                      ...colorPresets.map((color) => _buildColorPresetItem(color)),
                      _buildColorPickerItem()
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            RoundedContainer(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("빈도")],
              ),
            ),
            SizedBox(height: 16),
            FilledButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.black),
              ),
              child: Text("습관 생성하기", style: TextStyle(color: Colors.white)),
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

  Widget _buildColorPresetItem(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: selectedColor == color
              ? Border.all(color: Colors.grey.shade400, width: 2)
              : null,
        ),
      ),
    );
  }

  Widget _buildNoneColorItem() {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = null;
        });
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: selectedColor == null
              ? Border.all(color: Colors.grey.shade400, width: 2)
              : null,
        ),
        child: Icon(Icons.block, size: 20, color: Colors.red.shade400),
      ),
    );
  }

  Widget _buildColorPickerItem() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: SweepGradient(
            colors: [
              Colors.red,
              Colors.orange,
              Colors.yellow,
              Colors.green,
              Colors.blue,
              Colors.purple,
            ],
          ),
        ),
      ),
    );
  }
}
