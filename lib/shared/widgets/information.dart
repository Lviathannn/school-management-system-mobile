import 'package:flutter/widgets.dart';
import 'package:school_management_system/shared/themes/app_texts.dart';

class Information extends StatelessWidget {
  final String title;
  final Widget child;

  const Information({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.caption,
        ),
        const SizedBox(height: 5),
        child,
      ],
    );
  }
}
