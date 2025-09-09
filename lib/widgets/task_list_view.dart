import 'package:flutter/material.dart';
import 'package:to_do_list/models/task.dart';
import 'package:to_do_list/widgets/task_widget.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key, required this.tasks});
  final List<Task> tasks;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: tasks.length,
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemBuilder: (context, index) => TaskWidget(task: tasks[index]),
    );
  }
}
