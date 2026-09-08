import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_routine_app/data/memory/todo_holder.dart';
import 'package:my_routine_app/screen/widget/w_todo_item.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoDataHolder>(
      builder: (dataHolder) {
        return dataHolder.todoList.isEmpty
            ? Text("할일을 작성해보세요")
            : Column(
                children: dataHolder.todoList
                    .map((e) => TodoItemWidget(e))
                    .toList(),
              );
      },
    );
  }
}
