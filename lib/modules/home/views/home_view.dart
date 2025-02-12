import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:school_management_system/modules/home/pages/income_page.dart';
import 'package:school_management_system/modules/home/pages/student_page.dart';
import 'package:school_management_system/modules/home/pages/teacher_page.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:school_management_system/shared/themes/app_images.dart';
import 'package:school_management_system/shared/themes/app_sizes.dart';
import 'package:school_management_system/shared/themes/app_texts.dart';
import '../controllers/home_controller.dart';
import '../pages/home_pages.dart';
import '../widgets/bottom_bar.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final List<Widget> _pages = [
    const HomePages(),
    StudentPage(),
    const TeacherPage(),
    const IncomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: PageView(
        allowImplicitScrolling: false,
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: controller.changeTabIndex,
        children: _pages,
      ),
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        toolbarHeight: 70,
        title: Row(
          children: [
            Row(
              children: [
                Image.asset(AppImages.logo, width: 35),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Halo, Anwar Sanusi!',
                        style: AppTextStyles.bodyBold.copyWith(
                          fontSize: 16,
                        )),
                    Text('Kepala Sekolah',
                        style: AppTextStyles.body.copyWith(
                          color: AppColors.textLight,
                        )),
                  ],
                ),
              ],
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
