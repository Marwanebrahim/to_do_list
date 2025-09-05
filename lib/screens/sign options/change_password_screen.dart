import 'package:flutter/material.dart';
import 'package:to_do_list/helper/asset_helper.dart';
import 'package:to_do_list/styles/app_colors.dart';
import 'package:to_do_list/styles/app_text_styles.dart';
import 'package:to_do_list/widgets/custom_button_widget.dart';
import 'package:to_do_list/widgets/text_form_field_widget.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
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
              SizedBox(height: 25,),
              Image.asset(AssetHelper.mainImage),
              SizedBox(height: 60,),

              TextFormFieldWidget(
                controller: passController,
                hint: "Password",
                validation: (value) {
                  return null;
                },
                isPassword: true,
              ),
              SizedBox(height: 18,),
              TextFormFieldWidget(
                controller: confirmPassController,
                hint: "Confirm Password",
                validation: (value) {
                  return null;
                },
                isPassword: true,
              ),
              SizedBox(height: 40),
              CustomButtonWidget(
                onTap: () {},
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
