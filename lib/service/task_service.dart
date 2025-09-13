
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/models/task.dart';

class TaskService {
  final String _boxName = "tasks";
  Future<List<Task>?> getTasks() async {
    try {
      await Future.delayed(Duration(seconds: 1));
      List<Task> tasks = Hive.box(
        _boxName,
      ).values.map((e) => Task.fromMap(e)).toList();
      return tasks;
    } catch (e) {
     
      return null;
    }
  }

  Future<bool> addTask(Task task) async {
    try {
      await Hive.box(_boxName).put(task.id, task.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> editTask(Task task) async {
    try {
      await Hive.box(_boxName).put(task.id, task.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteTask(Task task) async {
    try {
      await Hive.box(_boxName).delete(task.id);
      return true;
    } catch (e) {
      return false;
    }
  }
}
