import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:school_management_system/modules/home/controllers/student_controller.dart';
import 'package:school_management_system/modules/home/controllers/teacher_controller.dart';
import 'package:school_management_system/modules/home/controllers/income_controller.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import '../controllers/home_controller.dart';
import 'package:hugeicons/hugeicons.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    final StudentController studentController = Get.put(StudentController());
    final TeacherController teacherController = Get.put(TeacherController());
    final IncomeController incomeController = Get.put(IncomeController());

    const textStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.primary,
    );

    const tabBackgroundColor = AppColors.background;
    const activeColor = AppColors.primary;
    const iconColor = AppColors.textLight;
    const iconSize = 22.0;

    const tabs = [
      GButton(icon: HugeIcons.strokeRoundedHome11, text: 'Home'),
      GButton(icon: HugeIcons.strokeRoundedBackpack03, text: 'Siswa'),
      GButton(icon: HugeIcons.strokeRoundedMortarboard01, text: 'Guru'),
      GButton(icon: HugeIcons.strokeRoundedDollarSquare, text: 'Income'),
    ];

    return Obx(
      () => Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: GNav(
          gap: 8,
          activeColor: activeColor,
          color: iconColor,
          iconSize: iconSize,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: tabBackgroundColor,
          textStyle: textStyle,
          tabs: tabs,
          selectedIndex: controller.selectedIndex.value,
          onTabChange: (index) {
            controller.pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );

            controller.changeTabIndex(index);
            studentController.resetFilter();
            teacherController.resetFilter();
            incomeController.resetFilter();
          },
        ),
      ),
    );
  }
}
