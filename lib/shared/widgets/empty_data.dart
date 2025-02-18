import 'package:flutter/material.dart';
import 'package:school_management_system/shared/themes/app_images.dart';
import 'package:school_management_system/shared/themes/app_texts.dart';

class EmptyData extends StatelessWidget {
  final String message;
  const EmptyData({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          AppImages.empty,
          width: 100,
          height: 100,
        ),
        const SizedBox(height: 20),
        Text(
          message,
          style: AppTextStyles.caption,
        ),
      ])),
    );
  }
}
