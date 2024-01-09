import 'package:flutter/material.dart';
import 'package:task_check/controllers/task_controller.dart';
import 'package:task_check/views/widgets/task_view.dart';

class TasksHomeScreen extends StatefulWidget {
  const TasksHomeScreen({super.key});

  @override
  State<TasksHomeScreen> createState() => _TasksHomeScreenState();
}

class _TasksHomeScreenState extends State<TasksHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getTasks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('You have no tasks!!! Yayyyy'),
          );
        }
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            return TaskListWidget(task: snapshot.data![index]);
          },
        );
      },
    );
  }
}
