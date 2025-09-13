// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/cubit/get_task_cubit.dart';
import 'package:to_do_list/helper/asset_helper.dart';
import 'package:to_do_list/models/user.dart';
import 'package:to_do_list/screens/home_screen.dart';
import 'package:to_do_list/screens/sign%20options/change_password_screen.dart';
import 'package:to_do_list/screens/sign%20options/sign_up.dart';
import 'package:to_do_list/service/user_service.dart';
import 'package:to_do_list/styles/app_colors.dart';
import 'package:to_do_list/styles/app_text_styles.dart';
import 'package:to_do_list/widgets/custom_button_widget.dart';
import 'package:to_do_list/widgets/tapped_text.dart';
import 'package:to_do_list/widgets/text_form_field_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  UserService userService = UserService();
  final TextEditingController textController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    passController.dispose();
    super.dispose();
  }

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
              SizedBox(height: 90),
              TextFormFieldWidget(
                controller: textController,
                hint: "Email",
                validation: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Email is required";
                  }

                  if (!value.endsWith("@gmail.com")) {
                    return "This Email isn't valid";
                  }

                  return null;
                },
              ),
              SizedBox(height: 18),
              TextFormFieldWidget(
                controller: passController,
                hint: "Password",
                isPassword: true,
                validation: (String? value) {
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
              GestureDetector(
                onTap: () async {
                  if (textController.text.trim().isEmpty ||
                      !textController.text.endsWith("@gmail.com")) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Email is required")),
                    );
                    return;
                  } else {
                    User? user = await userService.isUSerFound(
                      email: textController.text,
                    );
                    if (user != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ChangePasswordScreen(currentUser: user),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please try again")),
                      );
                    }
                  }
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",
                    style: AppTextStyles.regular14.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 18),
              CustomButtonWidget(
                onTap: () async {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  bool isFound = await userService.getUser(
                    email: textController.text,
                    password: passController.text,
                  );

                  if (isFound) {
                    bool isDone = await userService.setCurrentUser(
                      textController.text,
                    );

                    if (isDone) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) => GetTaskCubit()..getTask(),
                            child: HomeScreen(),
                          ),
                        ),
                      );
                    }
                  } else {
                    _showSnackBar(context);
                  }
                },
                hieght: 45,
                width: 330,
                color: AppColors.orange,
                child: Center(
                  child: Text(
                    "Sign In",
                    style: AppTextStyles.medium18.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TappedText(
                firstString: "Dont have an account?",
                secondString: "Sign UP",
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp()),
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
        content: Text(
          "Please check email or password",
          style: AppTextStyles.medium20,
        ),
      ),
    );
  }
}
