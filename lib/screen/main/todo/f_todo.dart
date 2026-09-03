import 'package:flutter/material.dart';
import 'package:my_routine_app/data/memory/todo_holder.dart';
import '../../../common/datetime_extension.dart';
import '../../../data/memory/vo_todo.dart';
import '../../widget/w_drawer_menu.dart';
import '../../widget/w_rounded_container.dart';

class TodoFragment extends StatefulWidget {
  const TodoFragment({super.key});

  @override
  State<TodoFragment> createState() => _TodoFragmentState();
}

class _TodoFragmentState extends State<TodoFragment> {
  DateTime? _selectedDate;
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("마이 루틴"),),
      drawer: DrawerMenu(),
      body: Placeholder(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: RoundedContainer(
                    radius: 20,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    color: Theme.of(context).canvasColor,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          autofocus: true,
                          controller: _titleController,
                          decoration: InputDecoration(
                            hintText: "무엇을 하고 싶으신가요?",
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                        SizedBox(height: 6),
                        TextField(
                          controller: _descriptionController,
                          decoration: InputDecoration(
                            hintText: "설명",
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () async {
                                final date = await showDatePicker(
                                  context: context,
                                  initialDate: _selectedDate ?? DateTime.now(),
                                  firstDate: DateTime.now().subtract(
                                    Duration(days: 14),
                                  ),
                                  lastDate: DateTime.now().add(
                                    Duration(days: 365),
                                  ),
                                );
                                if (date != null) {
                                  setState(() {
                                    _selectedDate = date;
                                  });
                                }
                              },
                              icon: Icon(Icons.calendar_month),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              visualDensity: VisualDensity.compact,
                              style: IconButton.styleFrom(
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                            ),
                            SizedBox(width: 6),
                            if (_selectedDate != null)
                              Text(_selectedDate!.formattedDate),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.flag),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              visualDensity: VisualDensity.compact,
                              style: IconButton.styleFrom(
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                            ),
                            Spacer(),
                            FilledButton(
                              onPressed: () {
                                if (_titleController.text.trim().isEmpty) {
                                  return;
                                }
                                final todoItem = TodoItem(
                                  id: DateTime.now().millisecondsSinceEpoch,
                                  title: _titleController.text,
                                  description:
                                  _descriptionController.text.trim().isEmpty
                                      ? null
                                      : _descriptionController.text,
                                  deadline: _selectedDate,
                                );
                                TodoHolder.of(context).notifier.addTodo(todoItem);
                              },
                              style: FilledButton.styleFrom(
                                minimumSize: Size.zero,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text("추가"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: const Icon(Icons.add),
        ),
    );
  }
}
