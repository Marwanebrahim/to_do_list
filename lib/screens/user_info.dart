// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/helper/asset_helper.dart';
import 'package:to_do_list/models/user.dart';
import 'package:to_do_list/screens/sign%20options/change_password_screen.dart';
import 'package:to_do_list/screens/sign%20options/sign_in.dart';
import 'package:to_do_list/service/user_service.dart';
import 'package:to_do_list/styles/app_colors.dart';
import 'package:to_do_list/styles/app_text_styles.dart';
import 'package:to_do_list/widgets/custom_button_widget.dart';
import 'package:to_do_list/widgets/text_in_row.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key, required this.user});
  final User user;
  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  UserService service = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          "To Do List",
          style: AppTextStyles.medium20.copyWith(
            color: AppColors.orange,
            fontFamily: GoogleFonts.bebasNeue().fontFamily,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetHelper.userINfoImage),
            TextInRow(firstText: "Full Name", secondText: widget.user.fullName),
            TextInRow(firstText: "Email", secondText: widget.user.email),
            Row(
              children: [
                Text(
                  "Password",
                  style: AppTextStyles.medium18.copyWith(color: AppColors.grey),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ChangePasswordScreen(currentUser: widget.user),
                      ),
                    );
                  },
                  child: Text(
                    "Change Password",
                    style: AppTextStyles.medium18.copyWith(
                      color: AppColors.orange,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            CustomButtonWidget(
              onTap: () async {
                bool isDeleted = await service.deleteCurrentUser();
                if (isDeleted) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                  );
                } else {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Please try again")));
                }
              },
              hieght: 50,
              width: 250,
              color: AppColors.orange,
              child: Center(
                child: Text(
                  "Log Out",
                  style: AppTextStyles.medium18.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
