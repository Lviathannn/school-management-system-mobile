import 'package:flutter/material.dart';
import 'package:school_management_system/modules/auth/pages/login_pages.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: LoginPages(),
    );
  }
}
