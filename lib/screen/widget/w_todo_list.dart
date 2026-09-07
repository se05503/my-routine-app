import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_routine_app/data/memory/todo_holder.dart';
import 'package:my_routine_app/screen/widget/w_todo_item.dart';

class TodoList extends StatelessWidget with TodoDataProvider {
  TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => todoDataHolder.todoList.isEmpty
        ? Text("할일을 작성해보세요")
        : Column(children: todoDataHolder.todoList.map((e) => TodoItemWidget(e)).toList()));
  }
}
