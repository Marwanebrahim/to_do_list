import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/models/task.dart';
import 'package:to_do_list/styles/app_colors.dart';
import 'package:to_do_list/styles/app_text_styles.dart';

class DisplayTask extends StatelessWidget {
  const DisplayTask({super.key, required this.task});
  final Task task;
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat("d MMM yyyy").format(task.createdAt);
    return Scaffold(
      appBar: _gatAppBar(),
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
            Text(task.discribtion, style: AppTextStyles.medium16),
            task.image != null
                ? Image.memory(
                    task.image!,
                    fit: BoxFit.cover,
                    height: 200,
                    width: 200,
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

  AppBar _gatAppBar() {
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
          onPressed: () {},
          icon: Icon(Icons.mode_edit_outlined),
          visualDensity: VisualDensity(horizontal: -4),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.delete_outline),
          visualDensity: VisualDensity(horizontal: -4),
        ),
      ],
    );
  }
}
