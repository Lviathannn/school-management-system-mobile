import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:school_management_system/shared/themes/app_texts.dart';

class TitleIcon extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final String subtitle;

  const TitleIcon({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: HugeIcon(
            icon: icon,
            color: AppColors.white,
            size: 22,
          ),
        ),
        const SizedBox(width: 10),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.subtitle
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                Text(subtitle, style: AppTextStyles.caption),
              ],
            )
          ],
        )
      ],
    );
  }
}
