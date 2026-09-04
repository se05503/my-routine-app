import 'package:flutter/material.dart';
import 'package:my_routine_app/data/memory/todo_notifier.dart';
import 'package:my_routine_app/data/memory/vo_todo.dart';

class TodoHolder extends InheritedWidget {
  final TodoNotifier notifier;

  const TodoHolder({super.key, required super.child, required this.notifier});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static TodoHolder _of(BuildContext context) {
    TodoHolder inherited = (context.dependOnInheritedWidgetOfExactType<TodoHolder>())!;
    return inherited;
  }

  void removeTodoItem(TodoItem todoItem) {
    notifier.value.remove(todoItem);
    notifier.notify();
  }
}

extension TodoHolderExtension on BuildContext {
  TodoHolder get holder => TodoHolder._of(this);
}