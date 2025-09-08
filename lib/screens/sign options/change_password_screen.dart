
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:to_do_list/helper/asset_helper.dart';
import 'package:to_do_list/models/user.dart';
import 'package:to_do_list/service/user_service.dart';
import 'package:to_do_list/styles/app_colors.dart';
import 'package:to_do_list/styles/app_text_styles.dart';
import 'package:to_do_list/widgets/custom_button_widget.dart';
import 'package:to_do_list/widgets/text_form_field_widget.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key, required this.currentUser});
  final User currentUser;
  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  UserService userService = UserService();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  @override
  void dispose() {
    passController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(backgroundColor: AppColors.white),

      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: ListView(
            children: [
              Image.asset(AssetHelper.mainImage),
              SizedBox(height: 90),

              TextFormFieldWidget(
                controller: passController,
                hint: "Password",
                validation: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Password is required";
                  }
                  if (value.length < 8) {
                    return "Password should contain 8 characters";
                  }
                  return null;
                },
                isPassword: true,
              ),
              SizedBox(height: 18),
              TextFormFieldWidget(
                controller: confirmPassController,
                hint: "Confirm Password",
                validation: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "you should Confirm password";
                  }
                  if (value != passController.text) {
                    return "Password not match";
                  }
                  return null;
                },
                isPassword: true,
              ),
              SizedBox(height: 40),
              CustomButtonWidget(
                onTap: () async {
                  if (! _formKey.currentState!.validate()) {
                    return;
                  }
                  User modifiedUser = User(
                    email: widget.currentUser.email,
                    fullName: widget.currentUser.fullName,
                    password: passController.text,
                  );
                  bool isDone = await userService.changePassword(
                    modifiedUser: modifiedUser,
                  );
                  if (isDone) {
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Please Try again")));
                  }
                },
                hieght: 45,
                width: 330,
                color: AppColors.orange,
                child: Center(
                  child: Text(
                    "Change Password",
                    style: AppTextStyles.medium18.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
