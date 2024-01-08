import 'package:flutter/material.dart';
import 'package:task_check/controllers/task_controller.dart';
import 'package:task_check/model/task.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Add Task:',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Form(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Divider below App Bar
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  child: Divider(
                    thickness: 2,
                    color: Colors.grey.shade800,
                  ),
                ),
                // Main Form
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.1,
                ),
                const Text(
                  'Task Title',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter task title',
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: const EdgeInsets.all(12.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: const TextStyle(fontSize: 16.0),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.05,
                ),
                const Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Enter task title',
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: const EdgeInsets.all(12.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: const TextStyle(fontSize: 16.0),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.05,
                ),
                ElevatedButton(
                  onPressed: () async {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent, // Dark background color
                    foregroundColor: Colors.white, // Text color
                    elevation: 8.0, // Button elevation
                    padding: const EdgeInsets.all(16.0), // Button padding
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Button border radius
                    ),
                  ),
                  child: const Text('Add Task'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
