import 'package:flutter/material.dart';
import 'package:task_check/model/task_model.dart';

class TaskListWidget extends StatefulWidget {
  final TaskModel task;
  const TaskListWidget({super.key, required this.task});

  @override
  State<TaskListWidget> createState() => _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // check box
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        // Task Title
        Text(
          widget.task.title,
          style: TextStyle(
            decoration:
                isChecked ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
      ],
    );
  }
}
