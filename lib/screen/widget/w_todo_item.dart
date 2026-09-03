import 'package:flutter/material.dart';
import 'package:my_routine_app/common/datetime_extension.dart';
import 'package:my_routine_app/screen/widget/w_rounded_container.dart';
import '../../data/memory/vo_todo.dart';

class TodoItemWidget extends StatelessWidget {
  final TodoItem todoItem;

  const TodoItemWidget(this.todoItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      margin: EdgeInsets.only(left: 16, right: 16, top: 12),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Checkbox(
                value: true,
                onChanged: null,
                fillColor: WidgetStateProperty.all(Colors.grey),
              ),
              Expanded(child: Text(todoItem.title)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
            child: Row(children: [
              (todoItem.deadline != null) ? Text(todoItem.deadline!.formattedDate) : Text("기한 없음"),
              Spacer(),
              Text("기본함")
            ],),
          )
        ],
      ),
    );
  }
}
