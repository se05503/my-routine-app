import 'package:flutter/cupertino.dart';
import 'package:my_routine_app/data/memory/vo_todo.dart';

class TodoNotifier extends ValueNotifier<List<TodoItem>> {
  TodoNotifier() : super([]);

  void addTodo(TodoItem todo) {
    value.add(todo);
    notifyListeners();
  }
}