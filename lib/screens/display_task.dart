import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/cubit/get_task_cubit.dart';
import 'package:to_do_list/models/task.dart';
import 'package:to_do_list/styles/app_colors.dart';
import 'package:to_do_list/styles/app_text_styles.dart';
import 'package:to_do_list/widgets/custom_bottom_sheet.dart';
import 'package:to_do_list/widgets/delete_bottom_sheet.dart';

class DisplayTask extends StatelessWidget {
  const DisplayTask({super.key, required this.task});
  final Task task;
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat("d MMM yyyy").format(task.createdAt);
    return Scaffold(
      appBar: _gatAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: AppTextStyles.bold20.copyWith(
                fontFamily: GoogleFonts.montserrat().fontFamily,
              ),
            ),
            Text(task.description, style: AppTextStyles.medium16),
            task.image != null
                ? Center(
                  child: Image.memory(
                      task.image!,
                      fit: BoxFit.cover,
                      height: 200,
                      width: 200,
                    ),
                )
                : Spacer(),
            Spacer(),
            Center(
              child: Text(
                "Created at $formattedDate",
                style: AppTextStyles.medium16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _gatAppBar(BuildContext context) {
    return AppBar(
      actions: [
        task.deadLine == null
            ? Icon(Icons.access_time, color: AppColors.black)
            : IconButton(
                onPressed: () {},
                icon: Icon(Icons.access_time),
                visualDensity: VisualDensity(horizontal: -4),
              ),
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (_) => BlocProvider.value(
                value: context.read<GetTaskCubit>(),
                child: CustomBottomSheet(task: task),
              ),
            );
          },
          icon: Icon(Icons.mode_edit_outlined),
          visualDensity: VisualDensity(horizontal: -4),
        ),
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              isDismissible: false,
              enableDrag: false,
              context: context,
              backgroundColor: AppColors.transparent,
              builder: (_) => BlocProvider.value(
                value: context.read<GetTaskCubit>(),
                child: DeleteBottomSheet(task: task),
              ),
            );
          },
          icon: Icon(Icons.delete_outline),
          visualDensity: VisualDensity(horizontal: -4),
        ),
      ],
    );
  }
}
