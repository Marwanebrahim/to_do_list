
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:to_do_list/helper/asset_helper.dart';
import 'package:to_do_list/models/user.dart';
import 'package:to_do_list/screens/home_screen.dart';
import 'package:to_do_list/screens/sign%20options/sign_in.dart';
import 'package:to_do_list/service/user_service.dart';
import 'package:to_do_list/styles/app_colors.dart';
import 'package:to_do_list/styles/app_text_styles.dart';
import 'package:to_do_list/widgets/custom_button_widget.dart';
import 'package:to_do_list/widgets/tapped_text.dart';
import 'package:to_do_list/widgets/text_form_field_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  UserService userService = UserService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: 15),
              Image.asset(AssetHelper.mainImage),
              TextFormFieldWidget(
                controller: emailController,
                hint: "Email",
                validation: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Email is required";
                  }

                  if (! value.endsWith("@gmail.com")) {
                    return "This Email isn't valid";
                  }

                  return null;
                },
              ),
              SizedBox(height: 18),
              TextFormFieldWidget(
                controller: fullNameController,
                hint: "Full Name",
                validation: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Name is required";
                  }
                  return null;
                },
              ),
              SizedBox(height: 18),
              TextFormFieldWidget(
                controller: passController,
                hint: "Password",
                isPassword: true,
                validation: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Password is required";
                  }
                  if (value.length < 8) {
                    return "Password should contain 8 characters";
                  }
                  return null;
                },
              ),
              SizedBox(height: 18),
              TextFormFieldWidget(
                controller: confirmPassController,
                hint: "Confirm Password",
                isPassword: true,
                validation: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "you should Confirm password";
                  }
                  if (value != passController.text) {
                    return "Password not match";
                  }
                  return null;
                },
              ),
              SizedBox(height: 18),
              CustomButtonWidget(
                onTap: () async {
                  if (! _formKey.currentState!.validate()) {
                    return;
                  }

                  User? user = await userService.addUser(
                    name: fullNameController.text,
                    email: emailController.text,
                    password: passController.text,
                  );
                  if (user == null) {
                    _showSnackBar(context);
                  }
                  bool isDone = await userService.setCurrentUser(
                    emailController.text,
                  );

                  if (isDone) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  } else {
                    _showSnackBar(context);
                  }
                },
                hieght: 45,
                width: 330,
                color: AppColors.orange,
                child: Center(
                  child: Text(
                    "Sign Up",
                    style: AppTextStyles.medium18.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TappedText(
                firstString: "Have an account?",
                secondString: "Log in",
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("please try again", style: AppTextStyles.medium20),
      ),
    );
  }
}
