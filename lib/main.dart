import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_check/views/screens/add_task.dart';
import 'package:task_check/views/widgets/clock.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initializes database
  try {
    openDatabase(
      join(
        await getDatabasesPath(),
        'tasks.db',
      ),
      // onCreate: (db, version) {
      //   db.execute('');
      //   version = 1;
      // },
    );
  } catch (err) {
    if (kDebugMode) {
      print('Error: $err');
    }
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Check',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'ToDo List:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.4,
                    ),
                    const Clock(),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.9,
                child: Divider(
                  thickness: 2,
                  color: Colors.grey.shade800,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddTask(),
                  ),
                );
              },
              shape: const StadiumBorder(),
              backgroundColor: Colors.blueAccent,
              child: const Icon(
                Icons.add,
                weight: 50,
                size: 32,
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}
