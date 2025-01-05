import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/modules/auth/controllers/auth_controller.dart';
import 'package:school_management_system/modules/auth/pages/login_pages.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final AuthController controller = Get.find();

    return const Scaffold(
      backgroundColor: AppColors.background,
      body: LoginPages(),
    );
  }
}
