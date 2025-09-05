import 'package:flutter/material.dart';
import 'package:to_do_list/styles/app_colors.dart';
import 'package:to_do_list/styles/app_text_styles.dart';

class TappedText extends StatelessWidget {
  const TappedText({
    super.key,
    required this.firstString,
    required this.secondString, required this.onTap,
  });
  final String firstString;
  final String secondString;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstString,
          style: AppTextStyles.regular14.copyWith(color: AppColors.grey),
        ),

        GestureDetector(
          onTap: onTap,
          child: Text(
            secondString,
            style: AppTextStyles.regular14.copyWith(color: AppColors.orange),
          ),
        ),
      ],
    );
  }
}
