import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/modules/teacher_detail/controllers/teacher_detail_controller.dart';
import 'package:school_management_system/modules/teacher_detail/pages/teacher_detail.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';

class TeacherDetailView extends StatelessWidget {
  const TeacherDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final TeacherDetailController controller = Get.find();

    return const Scaffold(
      backgroundColor: AppColors.background,
      body: TeacherDetail(),
    );
  }
}
