import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, // 헤더가 시스템 바 영역을 넘어가도록 함 (이게 더 자연스러워 보여서 일단 넣음)
        children: [
          SizedBox(
            height: 120,
            child: DrawerHeader(
              margin: EdgeInsets.zero, // 하단 여백 제거
              decoration: BoxDecoration(color: Colors.grey),
              child: Row(
                children: [
                  CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.person)),
                  SizedBox(width: 10),
                  Text("버드리")
                ],
              ),
            ),
          ),
          ListTile(
            selectedColor: Colors.red,
            leading: Icon(Icons.home),
            title: Text("홈"),
            subtitle: Text("제목 아래의 작은 보충 설명"),
            trailing: Icon(Icons.add),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
