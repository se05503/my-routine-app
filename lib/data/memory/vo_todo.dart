import 'package:my_routine_app/data/memory/todo_status.dart';

class TodoItem {
  int id;
  final String title;
  final String? description;
  final DateTime createdTime;
  final DateTime? modifiedTime;
  final DateTime? deadline;
  TodoStatus status;

  TodoItem(
      {required this.id, required this.title, this.description, this.modifiedTime, this.deadline, this.status = TodoStatus
          .incomplete}) : createdTime = DateTime.now();
}