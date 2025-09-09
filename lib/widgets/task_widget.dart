import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/models/task.dart';
import 'package:to_do_list/styles/app_colors.dart';
import 'package:to_do_list/styles/app_text_styles.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat("d MMM yyyy").format(task.createdAt);
    return Container(
      height: 150,
      padding: EdgeInsets.all(12),
      decoration: _getBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 6,
        children: [
          Row(
            children: [
              Text(
                task.title,
                style: AppTextStyles.bold16.copyWith(
                  color: AppColors.white,
                  fontFamily: GoogleFonts.montserrat().fontFamily,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Spacer(),
              task.deadLine == null
                  ? SizedBox.shrink()
                  : Icon(Icons.access_time, color: AppColors.white),
            ],
          ),
          Text(
            task.discribtion,
            style: AppTextStyles.medium16.copyWith(color: AppColors.white),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Spacer(),
          Text(
            "Created at $formattedDate",
            style: AppTextStyles.medium16.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }

  BoxDecoration _getBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      boxShadow: [BoxShadow(blurRadius: 10, color: AppColors.black)],
      color: task.deadLine == null ? AppColors.orange : AppColors.lightRed,
    );
  }
}
