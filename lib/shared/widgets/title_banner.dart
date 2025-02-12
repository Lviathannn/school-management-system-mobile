import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:school_management_system/shared/themes/app_sizes.dart';
import 'package:school_management_system/shared/themes/app_texts.dart';

class TitleBanner extends StatelessWidget {
  final String text;
  final Color? color;

  const TitleBanner({super.key, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border(
          left: BorderSide(
            color: color ?? AppColors.primary,
            width: 5,
          ),
        ),
        borderRadius: BorderRadius.circular(AppSizes.borderRadius),
      ),
      padding: const EdgeInsets.all(AppSizes.paddingSmall),
      width: double.infinity,
      child: Text(
        text,
        style: AppTextStyles.heading,
      ),
    );
  }
}
