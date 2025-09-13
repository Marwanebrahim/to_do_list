import 'package:to_do_list/models/task.dart';

class GetTaskState {}

class GetTaskInitialState extends GetTaskState {}

class GetTaskLoadingState extends GetTaskState {}

class GetTaskFailedState extends GetTaskState {}

class GetTaskSuccessState extends GetTaskState {
  final List<Task> tasks;

  GetTaskSuccessState({required this.tasks});
}
