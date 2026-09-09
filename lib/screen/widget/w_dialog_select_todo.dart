import 'package:flutter/material.dart';

class SelectTodoDialog extends StatefulWidget {
  const SelectTodoDialog({super.key});

  @override
  State<SelectTodoDialog> createState() => _SelectTodoDialogState();
}

class _SelectTodoDialogState extends State<SelectTodoDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: EdgeInsets.all(20),
        width: 200,
        height: 300,
        child: Column(children: [
          Text("기본 다이얼로그 창")
        ],),
      ),
    );
  }
}
