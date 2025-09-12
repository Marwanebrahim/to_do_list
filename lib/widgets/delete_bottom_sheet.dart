import 'package:flutter/material.dart';
import 'package:to_do_list/styles/app_colors.dart';
import 'package:to_do_list/styles/app_text_styles.dart';
import 'package:to_do_list/widgets/custom_button_widget.dart';

class DeleteBottomSheet extends StatelessWidget {
  const DeleteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.transparent),
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 30,
        children: [
          CustomButtonWidget(
            onTap: () {},
            hieght: 50,
            width: 290,
            color: AppColors.white,
            child: Center(
              child: Text(
                "Delete ToDo",
                style: AppTextStyles.medium20.copyWith(color: AppColors.red),
              ),
            ),
          ),

          CustomButtonWidget(
            onTap: () {
              Navigator.pop(context);
            },
            hieght: 50,
            width: 290,
            color: AppColors.white,
            child: Center(
              child: Text(
                "Cancel",
                style: AppTextStyles.medium20.copyWith(color: Colors.green),
              ),
            ),
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}
