import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task_check/controllers/task_controller.dart';
import 'package:task_check/model/task.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _descController;

  Future<void> submitForm() async {
    if (_formKey.currentState!.validate()) {
      int x = await addTask(
        task: TaskModel(
          title: _titleController.text,
          desc: _descController.text,
        ),
      );

      if (x == 1) {
        if (kDebugMode) {
          print('added');
        }
      } else {
        if (kDebugMode) {
          print('error in adding');
        }
      }
    }
  }

  @override
  void initState() {
    _titleController = TextEditingController();
    _descController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

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
        key: _formKey,
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
                  controller: _titleController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please fill a Title';
                    }
                    return null;
                  },
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
                  controller: _descController,
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
                  onPressed: () async {
                    await submitForm();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    elevation: 8.0,
                    padding: const EdgeInsets.all(16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
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
