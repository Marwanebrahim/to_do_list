
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/cubit/get_task_state.dart';
import 'package:to_do_list/models/task.dart';
import 'package:to_do_list/service/task_service.dart';

class GetTaskCubit extends Cubit<GetTaskState> {
  final TaskService taskService = TaskService();
  GetTaskCubit() : super(GetTaskState());

  void getTask() async {
    emit(GetTaskLoadingState());

    try {
      List<Task>? tasks = await taskService.getTasks();
      emit(GetTaskSuccessState(tasks: tasks!));
    } catch (e) {
      emit(GetTaskFailedState());
    }
  }
}
