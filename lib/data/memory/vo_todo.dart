import 'package:my_routine_app/data/memory/todo_status.dart';

class TodoItem {
  int id;
  String title;
  String? description;
  final DateTime createdTime;
  DateTime? modifiedTime;
  DateTime? deadline;
  TodoStatus status;

  TodoItem(
      {required this.id, required this.title, this.description, this.modifiedTime, this.deadline, this.status = TodoStatus
          .incomplete}) : createdTime = DateTime.now();
}