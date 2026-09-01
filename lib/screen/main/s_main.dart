import 'package:flutter/material.dart';
import 'package:my_routine_app/common/datetime_extension.dart';
import 'package:my_routine_app/screen/main/search/f_search.dart';
import 'package:my_routine_app/screen/main/todo/f_todo.dart';

import '../widget/w_rounded_container.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _screens = [TodoFragment(), SearchFragment()];
  DateTime _selectedDate = DateTime.now();
  bool _isDateSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text('My Routine'),
      ),
      body: Center(child: _screens[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note_outlined),
            label: "할일",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "검색"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery
                      .of(context)
                      .viewInsets
                      .bottom,
                ),
                child: RoundedContainer(
                  radius: 20,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  color: Theme
                      .of(context)
                      .canvasColor,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: "무엇을 하고 싶으신가요?",
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                      SizedBox(height: 6),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "설명",
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () async {
                              final date = await showDatePicker(context: context,
                                  initialDate: _selectedDate,
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now().add(Duration(days: 365)));
                              if(date!=null) {
                                setState(() {
                                  _isDateSelected = true;
                                  _selectedDate = date;
                                });
                              }
                            },
                            icon: Icon(Icons.calendar_month),
                            padding: EdgeInsets.zero,
                            // 패딩 제거
                            constraints: const BoxConstraints(),
                            // 최소 크기 제약 제거
                            visualDensity: VisualDensity.compact,
                            // 시각적 밀도 압축
                            style: IconButton.styleFrom(
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                          ),
                          SizedBox(width: 6),
                          if(_isDateSelected) Text(_selectedDate.formattedDate),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.flag),
                            padding: EdgeInsets.zero,
                            // 패딩 제거
                            constraints: const BoxConstraints(),
                            // 최소 크기 제약 제거
                            visualDensity: VisualDensity.compact,
                            // 시각적 밀도 압축
                            style: IconButton.styleFrom(
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                          ),
                          Spacer(),
                          FilledButton(
                            onPressed: () {},
                            child: Text("추가"),
                            style: FilledButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
