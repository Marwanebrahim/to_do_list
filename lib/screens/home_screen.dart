// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/models/task.dart';
import 'package:to_do_list/models/user.dart';
import 'package:to_do_list/screens/user_info.dart';
import 'package:to_do_list/service/user_service.dart';
import 'package:to_do_list/styles/app_colors.dart';
import 'package:to_do_list/styles/app_text_styles.dart';
import 'package:to_do_list/widgets/task_list_view.dart';

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
            Expanded(child: TaskListView(tasks: tasks)),
          ],
        ),
      ),

      floatingActionButton: CircleAvatar(
        radius: 30,
        backgroundColor: AppColors.lightRed,
        child: IconButton(onPressed: () {
          
        }, icon: Icon(Icons.add,color: AppColors.white,size: 35,)),
      ),
    );
  }

  List<Task> tasks = [
    Task(
      title: "Design api ffffffffffff",
      discribtion:
          "Discribtion discribtion discribtion discribtion discribtion discribtion discribtion discribtion discribtion discribtion ",
      deadLine: null,
      createdAt: DateTime.now(),
      image: null,
    ),
    Task(
      title: "Disign ui/ux app",
      discribtion: "Disign",
      deadLine: DateTime.now(),
      createdAt: DateTime.now(),
      image: null,
    ),
  ];
}
