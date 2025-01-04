import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import '../controllers/home_controller.dart';
import 'package:hugeicons/hugeicons.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Obx(() => Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GNav(
            gap: 8,
            activeColor: AppColors.primary,
            color: AppColors.textLight,
            iconSize: 20,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: AppColors.background,
            textStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.primary),
            tabs: const [
              GButton(icon: HugeIcons.strokeRoundedHome11, text: 'Home'),
              GButton(icon: HugeIcons.strokeRoundedBackpack03, text: 'Murid'),
              GButton(icon: HugeIcons.strokeRoundedMortarboard01, text: 'Guru'),
              GButton(icon: HugeIcons.strokeRoundedCalendar02, text: 'Jadwal'),
              GButton(
                  icon: HugeIcons.strokeRoundedDollarSquare, text: 'Income'),
            ],
            selectedIndex: controller.selectedIndex.value,
            onTabChange: controller.changeTabIndex,
          ),
        ));
  }
}
