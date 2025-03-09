import 'package:flutter/material.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:school_management_system/shared/themes/app_sizes.dart';
import 'package:school_management_system/shared/themes/app_texts.dart';
import 'package:school_management_system/shared/widgets/title_icon.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String? value;
  final String description;
  final Color color;
  final bool isFetching;

  const DashboardCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.value,
    required this.description,
    required this.isFetching,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.borderRadius),
        boxShadow: [
          BoxShadow(
            color: AppColors.textLight.withOpacity(0.1),
            blurRadius: 10,
            blurStyle: BlurStyle.outer,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TitleIcon(
                title: title,
                icon: icon,
                color: color,
                subtitle: subtitle,
              ),
            ],
          ),
          const SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isFetching
                  ? Container(
                      width: 150,
                      height: 25,
                      margin: const EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        color: AppColors.textLight.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ))
                  : Text(
                      value.toString(),
                      style: AppTextStyles.heading,
                    ),
              isFetching
                  ? Container(
                      width: 100,
                      height: 20,
                      margin: const EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        color: AppColors.textLight.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ))
                  : Text(
                      description,
                      style: AppTextStyles.body,
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
