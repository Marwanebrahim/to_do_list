// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/cubit/get_task_cubit.dart';
import 'package:to_do_list/models/user.dart';
import 'package:to_do_list/screens/user_info.dart';
import 'package:to_do_list/service/user_service.dart';
import 'package:to_do_list/styles/app_colors.dart';
import 'package:to_do_list/styles/app_text_styles.dart';
import 'package:to_do_list/widgets/custom_bottom_sheet.dart';
import 'package:to_do_list/widgets/get_tasks_boc_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserService service = UserService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "To Do List",
          style: AppTextStyles.medium20.copyWith(
            color: AppColors.orange,
            fontFamily: GoogleFonts.bebasNeue().fontFamily,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              User? user = await service.getCurrentUser();
              if (user != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserInfo(user: user)),
                );
              } else {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Please try again")));
              }
            },
            icon: Icon(Icons.settings_outlined, size: 26),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Row(
              spacing: 5,
              children: [
                Icon(
                  Icons.view_list_rounded,
                  color: AppColors.lightRed,
                  size: 28,
                ),
                Text(
                  "LIST OF TODO",
                  style: AppTextStyles.medium28.copyWith(
                    color: AppColors.lightRed,
                    fontFamily: GoogleFonts.bebasNeue().fontFamily,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Expanded(child: GetTasksBocBuilder()),
          ],
        ),
      ),

      floatingActionButton: CircleAvatar(
        radius: 30,
        backgroundColor: AppColors.lightRed,
        child: IconButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (_) => BlocProvider.value(
                value: context.read<GetTaskCubit>(),
                child: CustomBottomSheet(task: null),
              ),
            );
          },
          icon: Icon(Icons.add, color: AppColors.white, size: 35),
        ),
      ),
    );
  }
}
