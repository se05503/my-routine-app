import 'package:flutter/cupertino.dart';
import 'package:my_routine_app/data/memory/todo_notifier.dart';

class TodoHolder extends InheritedWidget {
  final TodoNotifier notifier;

  const TodoHolder({super.key, required super.child, required this.notifier});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static TodoHolder of(BuildContext context) {
    TodoHolder inherited = (context.dependOnInheritedWidgetOfExactType<TodoHolder>())!;
    return inherited;
  }
}