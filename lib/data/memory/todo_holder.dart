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
    update();
  }

  void notify() {
    todoList.refresh();
    update();
  }
}

mixin class TodoDataProvider {
  late TodoDataHolder todoDataHolder = Get.find();
}