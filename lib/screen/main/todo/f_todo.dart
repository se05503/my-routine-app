import 'package:flutter/material.dart';

import '../../widget/w_drawer_menu.dart';
import '../../widget/w_fab_todo.dart';

class TodoFragment extends StatefulWidget {
  const TodoFragment({super.key});

  @override
  State<TodoFragment> createState() => _TodoFragmentState();
}

class _TodoFragmentState extends State<TodoFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("마이 루틴")),
      drawer: DrawerMenu(),
      body: Placeholder(),
      floatingActionButton: FabTodo(),
    );
  }
}
