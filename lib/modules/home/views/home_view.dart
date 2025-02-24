import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/modules/home/pages/income_page.dart';
import 'package:school_management_system/modules/home/pages/student_page.dart';
import 'package:school_management_system/modules/home/pages/teacher_page.dart';
import 'package:school_management_system/modules/profile/controllers/profile_controller.dart';
import 'package:school_management_system/routes/routes.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:school_management_system/shared/themes/app_images.dart';
import 'package:school_management_system/shared/themes/app_texts.dart';
import '../controllers/home_controller.dart';
import '../pages/home_pages.dart';
import '../widgets/bottom_bar.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final List<Widget> _pages = [
    const HomePages(),
    const StudentPage(),
    const TeacherPage(),
    const IncomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    final ProfileController profileController = Get.put(ProfileController());

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
              width: 50,
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  alignment: Alignment.center,
                  overlayColor: AppColors.primary,
                  padding: const EdgeInsets.all(0),
                  shape: const CircleBorder(),
                  backgroundColor: AppColors.background,
                ),
                child: Obx(
                  () => profileController.isFetching.value
                      ? const SizedBox(
                          width: 25,
                          height: 25,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.primary,
                          ),
                        )
                      : CircleAvatar(
                          backgroundImage:
                              profileController.user.value!.url.isEmpty
                                  ? const AssetImage(AppImages.man)
                                  : NetworkImage(
                                      profileController.user.value!.url,
                                    ),
                        ),
                ),
                onPressed: () {
                  Get.toNamed(AppRoutes.PROFILE);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}
