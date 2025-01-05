import 'package:flutter/material.dart';
import 'package:school_management_system/modules/home/models/best_student_model.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:school_management_system/shared/themes/app_sizes.dart';
import 'package:school_management_system/shared/themes/app_texts.dart';

class BestStudentList extends StatelessWidget {
  final BestStudentModel student;
  const BestStudentList({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: AppSizes.paddingSmall),
      padding: const EdgeInsets.all(AppSizes.paddingSmall),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.background,
                foregroundImage: AssetImage(
                  student.imageUrl,
                ),
              ),
              const SizedBox(width: AppSizes.paddingSmall),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    student.studentClass,
                    style: AppTextStyles.caption,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
