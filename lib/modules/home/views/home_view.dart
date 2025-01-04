import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:school_management_system/shared/themes/app_images.dart';
import 'package:school_management_system/shared/themes/app_sizes.dart';
import 'package:school_management_system/shared/themes/app_texts.dart';
import '../controllers/home_controller.dart';
import '../pages/home_pages.dart';
import '../widgets/bottom_bar.dart';

class HomeView extends StatelessWidget {
  final List<Widget> _pages = [
    const HomePages(),
  ];

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Obx(() => _pages[controller.selectedIndex.value]),
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        toolbarHeight: 65,
        title: Row(
          children: [
            SizedBox(
              child: Row(
                children: [
                  Image.asset(AppImages.logo, width: 30),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Halo. Anwar Sanusi!',
                          style: AppTextStyles.bodyBold),
                      Text('Kepala Sekolah', style: AppTextStyles.caption),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 40,
              height: 40,
              child: TextButton(
                style: TextButton.styleFrom(
                  alignment: Alignment.center,
                  overlayColor: AppColors.primary,
                  padding: const EdgeInsets.all(5),
                  shape: const CircleBorder(),
                  backgroundColor: AppColors.background,
                ),
                child: const HugeIcon(
                  icon: HugeIcons.strokeRoundedUser,
                  color: AppColors.textLight,
                  size: AppSizes.iconSizeSmall,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}
