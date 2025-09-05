import 'package:flutter/material.dart';
import 'package:to_do_list/helper/asset_helper.dart';
import 'package:to_do_list/screens/sign%20options/change_password_screen.dart';
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
              SizedBox(height: 60),
              Image.asset(AssetHelper.mainImage),
              SizedBox(height: 60),
              TextFormFieldWidget(
                controller: textController,
                hint: "Email",
                validation: (String? value) {
                  return null;
                },
              ),
              SizedBox(height: 18),
              TextFormFieldWidget(
                controller: passController,
                hint: "Password",
                isPassword: true,
                validation: (String? value) {
                  return null;
                },
              ),
              SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangePasswordScreen(),
                    ),
                  );
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
              SizedBox(height: 12),
              CustomButtonWidget(
                onTap: () {},
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
              SizedBox(height: 15),
              TappedText(
                firstString: "Dont have an account?",
                secondString: "Sign UP",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
