import 'package:get/get.dart';
import 'package:my_routine_app/data/memory/vo_todo.dart';

class TodoDataHolder extends GetxController {
  final RxList<TodoItem> todoList = <TodoItem>[].obs;

  void addTodo(TodoItem todo) {
    todoList.add(todo);
  }

  void removeTodoItem(TodoItem todoItem) {
    todoList.remove(todoItem);
    todoList.refresh();
  }

  void notify() {
    todoList.refresh();
  }
}

mixin class TodoDataProvider {
  late final TodoDataHolder todoDataHolder = Get.find();
}