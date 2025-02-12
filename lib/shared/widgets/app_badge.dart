import 'package:flutter/widgets.dart';
import 'package:school_management_system/shared/themes/app_texts.dart';

class AppBadge extends StatelessWidget {
  final String text;
  final Color color;
  final Color backgroundColor;
  const AppBadge({
    super.key,
    required this.text,
    required this.color,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        text,
        style: AppTextStyles.body
            .copyWith(color: color, fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }
}
