import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/modules/student_detail/controllers/student_detail_controller.dart';
import 'package:school_management_system/modules/student_detail/pages/student_detail.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';

class StudentDetailView extends StatelessWidget {
  const StudentDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final StudentDetailController controller = Get.find();

    return const Scaffold(
      backgroundColor: AppColors.background,
      body: StudentDetail(),
    );
  }
}
