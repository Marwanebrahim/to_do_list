import 'package:flutter/material.dart';
import 'package:to_do_list/styles/app_colors.dart';
import 'package:to_do_list/styles/app_text_styles.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({
    super.key,
    required this.controller,
    required this.hint,
    this.isPassword = false,
    required this.validation,
  });
  final TextEditingController controller;
  final String hint;
  final bool isPassword;
  final String? Function(String?)? validation;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool _obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validation,
      obscureText: widget.isPassword ? _obsecureText : false,
      controller: widget.controller,
      decoration: InputDecoration(
        hint: Text(
          widget.hint,
          style: AppTextStyles.regular16.copyWith(color: AppColors.grey),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.red),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  _obsecureText = !_obsecureText;
                  setState(() {});
                },
                icon: Icon(
                  _obsecureText ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : null,
      ),
    );
  }
}
