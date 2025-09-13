// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/cubit/get_task_cubit.dart';
import 'package:to_do_list/models/task.dart';
import 'package:to_do_list/service/task_service.dart';
import 'package:to_do_list/styles/app_colors.dart';
import 'package:to_do_list/styles/app_text_styles.dart';
import 'package:to_do_list/widgets/custom_button_widget.dart';

class DeleteBottomSheet extends StatefulWidget {
  const DeleteBottomSheet({super.key, required this.task});
  final Task task;

  @override
  State<DeleteBottomSheet> createState() => _DeleteBottomSheetState();
}

class _DeleteBottomSheetState extends State<DeleteBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.transparent),
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 30,
        children: [
          CustomButtonWidget(
            onTap: () async {
              TaskService taskService = TaskService();
              bool isDeleted = await taskService.deleteTask(widget.task);
              if (!mounted) return;
              if (isDeleted) {
                context.read<GetTaskCubit>().getTask();
                Navigator.pop(context, true);
              } else {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Please try again")));
              }
            },
            hieght: 50,
            width: 290,
            color: AppColors.white,
            child: Center(
              child: Text(
                "Delete ToDo",
                style: AppTextStyles.medium20.copyWith(color: AppColors.red),
              ),
            ),
          ),

          CustomButtonWidget(
            onTap: () {
              Navigator.pop(context);
            },
            hieght: 50,
            width: 290,
            color: AppColors.white,
            child: Center(
              child: Text(
                "Cancel",
                style: AppTextStyles.medium20.copyWith(color: Colors.green),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
