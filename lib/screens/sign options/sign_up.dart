import 'package:flutter/material.dart';
import 'package:to_do_list/helper/asset_helper.dart';
import 'package:to_do_list/screens/sign%20options/sign_in.dart';
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
                  return null;
                },
              ),
              SizedBox(height: 18),
              TextFormFieldWidget(
                controller: fullNameController,
                hint: "Full Name",
                validation: (value) {
                  return null;
                },
              ),
              SizedBox(height: 18),
              TextFormFieldWidget(
                controller: passController,
                hint: "Password",
                isPassword: true,
                validation: (value) {
                  return null;
                },
              ),
              SizedBox(height: 18),
              TextFormFieldWidget(
                controller: passController,
                hint: "Confirm Password",
                isPassword: true,
                validation: (value) {
                  return null;
                },
              ),
              SizedBox(height: 18),
              CustomButtonWidget(
                onTap: () {},
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
}
