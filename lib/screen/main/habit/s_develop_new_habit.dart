import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:my_routine_app/data/memory/vo_day.dart';
import 'package:my_routine_app/screen/widget/w_rounded_container.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
    Colors.purple.shade400,
  ];
  Color? selectedColor;
  String iconName = "search";
  Set<Day> selectedDays = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        // Navigator.push로 들어온 화면일 경우 자동으로 뒤로가기 화살표를 생성해준다.
        // 만약 수동으로 아이콘을 지정하고 싶다면 leading 속성을 사용한다.
        title: Text("새로운 습관"),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                            "https://img.icons8.com/color/96/$iconName.png",
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.error);
                            },
                          ),
                        ),
                        SizedBox(width: 8),
                        Text("선택된 아이콘"),
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
                        prefixIcon: IconButton(
                          onPressed: () {
                            setState(() async {
                              final translatedIconName =
                                  await translateToEnglish(
                                    _iconNameController.text,
                                  );
                              if (translatedIconName != null) {
                                setState(() {
                                  iconName = translatedIconName;
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("알 수 없는 에러가 발생했습니다."),
                                  ), // 한글 → 영어 변환 과정에서의 에러
                                );
                              }
                            });
                          },
                          icon: Icon(Icons.search),
                        ),
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
                        ...colorPresets.map(
                          (color) => _buildColorPresetItem(color),
                        ),
                        _buildColorPickerItem(),
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
                  children: [
                    Text("빈도"),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...Day.values.map((day) => _buildDayItem(day))
                      ],
                    ),
                  ],
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
      onTap: _showCustomColorPickerDialog,
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

  Widget _buildDayItem(Day day) {
    bool isSelected = selectedDays.contains(day);
    return GestureDetector(
      onTap: () {
        setState(() {
          if(isSelected) {
            selectedDays.remove(day);
          } else {
            selectedDays.add(day);
          }
        });
      },
      child: Container(
        width: 30,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.blueAccent : Colors.grey.shade200,
        ),
        child: Text(
          day.krName,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _showCustomColorPickerDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("커스텀 색상 선택"),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: selectedColor ?? Colors.transparent,
              onColorChanged: (color) {
                setState(() {
                  selectedColor = color;
                });
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.grey,
              ),
              child: Text("취소"),
            ),
            TextButton(
              // 선택된 색상 적용
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.grey,
              ),
              child: Text("확인"),
            ),
          ],
        );
      },
    );
  }

  Future<String?> translateToEnglish(String koreanText) async {
    final url = Uri.parse(
      "https://api.mymemory.translated.net/get?q=$koreanText&langpair=ko|en",
    );
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        String translatedText = data['responseData']['translatedText'];
        return translatedText.toLowerCase(); // 첫 글자가 대문자로 시작함 → 소문자로 변경
      }
    } catch (e) {
      debugPrint("translate error: $e");
    }
    // 통신 실패나 에러가 난 경우 null 반환
    return null;
  }
}
