import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/cubit/get_task_cubit.dart';
import 'package:to_do_list/cubit/get_task_state.dart';
import 'package:to_do_list/widgets/task_list_view.dart';

class GetTasksBocBuilder extends StatelessWidget {
  const GetTasksBocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTaskCubit, GetTaskState>(
      builder: (context, state) {
        if (state is GetTaskLoadingState) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is GetTaskFailedState) {
          return Center(child: Text("Failed To Load News"));
        }

        if (state is GetTaskSuccessState) {
          return TaskListView(tasks: state.tasks);
        }
        return Text("Unknown state");
      },
    );
  }
}
