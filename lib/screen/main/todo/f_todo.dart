import 'package:flutter/material.dart';

import '../../widget/w_dialog_todo.dart';
import '../../widget/w_drawer_menu.dart';
import '../../widget/w_todo_list.dart';

class TodoFragment extends StatefulWidget {
  const TodoFragment({super.key});

  @override
  State<TodoFragment> createState() => _TodoFragmentState();
}

class _TodoFragmentState extends State<TodoFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(title: Text("마이 루틴")),
      drawer: DrawerMenu(),
      body: Column(children: [
        TodoList()
      ],),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return TodoDialog();
            },
          );
        },
        child: const Icon(Icons.add),
      )
    );
  }
}
