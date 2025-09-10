import 'package:flutter/material.dart';
import 'package:to_do_list/styles/app_colors.dart';
import 'package:to_do_list/styles/app_text_styles.dart';

class TextInRow extends StatelessWidget {
  const TextInRow({
    super.key,
    required this.firstText,
    required this.secondText,
  });
  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          firstText,
          style: AppTextStyles.medium18.copyWith(color: AppColors.grey),
        ),
        Spacer(),
        Text(
          secondText,
          style: AppTextStyles.medium14.copyWith(color: AppColors.orange),
        ),
      ],
    );
  }
}
