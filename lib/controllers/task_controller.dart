import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_check/model/task_model.dart';

Future<int> addTask({required TaskModel task}) async {
  int status = 1;
  final database = openDatabase(join(await getDatabasesPath(), 'tasks.db'));
  final db = await database;
  try {
    await db.insert(
      'tasks',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  } catch (err) {
    if (kDebugMode) {
      print(err);
    }
    status = 0;
  }
  return status;
}

Future<int> deleteTask({required int id}) async {
  int status = 1;
  final database = openDatabase(join(await getDatabasesPath(), 'tasks.db'));
  final db = await database;
  try {
    await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  } catch (err) {
    if (kDebugMode) {
      print(err);
    }
  }
  return status;
}

Future<List<TaskModel>> getTasks() async {
  final database = openDatabase(join(await getDatabasesPath(), 'tasks.db'));
  final db = await database;
  List<TaskModel> tasks = [];
  try {
    final List<Map<String, dynamic>> map = await db.query('tasks');
    for (var element in map) {
      tasks.add(
        TaskModel(
          id: element['id'],
          title: element['title'],
          desc: element['desc'],
        ),
      );
    }
  } catch (err) {
    if (kDebugMode) {
      print(err);
    }
  }
  return tasks;
}
