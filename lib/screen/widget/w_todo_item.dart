import 'package:flutter/material.dart';
import 'package:my_routine_app/common/datetime_extension.dart';
import 'package:my_routine_app/data/memory/todo_holder.dart';
import 'package:my_routine_app/screen/widget/w_rive_bottle.dart';
import 'package:my_routine_app/screen/widget/w_rive_crab.dart';
import 'package:my_routine_app/screen/widget/w_rounded_container.dart';
import '../../data/memory/todo_status.dart';
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
              GestureDetector(
                onTap: () async {
                  switch (todoItem.status) {
                    case TodoStatus.incomplete:
                      todoItem.status = TodoStatus.ongoing;
                      context.holder.notifier.notify();
                    case TodoStatus.ongoing:
                      todoItem.status = TodoStatus.complete;
                      context.holder.notifier.notify();
                    case TodoStatus.complete:
                      final result = await showDialog<bool>(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text("정말로 처음 상태로 변경하시겠어요?"),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: Text("취소"),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: Text("확인"),
                              ),
                            ],
                          );
                        },
                      );
                      if (result == true && context.mounted) {
                        todoItem.status = TodoStatus.incomplete;
                        context.holder.notifier.notify();
                      }
                  }
                },
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: switch (todoItem.status) {
                    TodoStatus.incomplete => const Checkbox(
                      value: false,
                      onChanged: null,
                    ),
                    TodoStatus.ongoing => const RiveBottle(),
                    TodoStatus.complete => Checkbox(
                      value: true,
                      onChanged: null,
                      fillColor: WidgetStateProperty.all(Colors.grey),
                    ),
                  },
                ),
              ),
              Expanded(child: Text(todoItem.title)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
            child: Row(
              children: [
                (todoItem.deadline != null)
                    ? Text(todoItem.deadline!.relativeDate)
                    : Text("기한 없음"),
                Spacer(),
                Text("기본함"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
