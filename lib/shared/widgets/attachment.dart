import 'package:flutter/widgets.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:school_management_system/shared/themes/app_sizes.dart';
import 'package:school_management_system/shared/themes/app_texts.dart';

class Attachment extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const Attachment(
      {super.key,
      required this.title,
      required this.icon,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(AppSizes.paddingSmall),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(AppSizes.borderRadius),
        ),
        child: Row(
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
            const SizedBox(width: 20),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.body
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const Text("Downlod File", style: AppTextStyles.link),
                  ],
                )
              ],
            )
          ],
        ));
  }
}
