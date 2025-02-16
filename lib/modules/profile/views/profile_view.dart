import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:school_management_system/modules/profile/controllers/profile_controller.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:school_management_system/shared/themes/app_images.dart';
import 'package:school_management_system/shared/themes/app_texts.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: const ProfilePage(),
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(HugeIcons.strokeRoundedArrowLeft01,
                  color: AppColors.text, size: 20),
            ),
            Text(
              "Profile",
              style: AppTextStyles.body.copyWith(
                color: AppColors.text,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.find();

    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 80,
                height: 80,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(AppImages.man),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Anwar Sanusi",
                style: AppTextStyles.bodyBold.copyWith(
                  fontSize: 20,
                  color: AppColors.text,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Active Since -",
                    style: AppTextStyles.caption.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "Jan, 2025",
                    style: AppTextStyles.body.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Personal Information",
                style: AppTextStyles.body.copyWith(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const HugeIcon(
                          icon: HugeIcons.strokeRoundedMail01,
                          color: AppColors.textLight,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "Email",
                          style: AppTextStyles.caption.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "anwar.sanusi@gmail.com",
                      style: AppTextStyles.caption.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const HugeIcon(
                          icon: HugeIcons.strokeRoundedAiPhone01,
                          color: AppColors.textLight,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "Telephone",
                          style: AppTextStyles.caption.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "08195280343",
                      style: AppTextStyles.caption.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 40,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Get.dialog(
                  AlertDialog(
                  backgroundColor: AppColors.white,
                  title: const Text(
                    "Keluar",
                    style: TextStyle(
                      color: AppColors.text,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  content: const Text(
                    "Apakah anda yakin ingin keluar dari aplikasi?",
                    style: TextStyle(
                      color: AppColors.text,
                      fontSize: 14,
                    ),
                  ),
                  actions: [
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  surfaceTintColor: AppColors.white,
                                  overlayColor:
                                      AppColors.primary.withOpacity(0.1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor:
                                      AppColors.textLight.withOpacity(0.1),
                                ),
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: AppColors.primary,
                                  foregroundColor: Colors.white, // Warna teks
                                ),
                                onPressed: () {
                                  ProfileController().logout();
                                },
                                child: const Text("Logout"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
                );
              },
              child: Text(
                "Keluar",
                style: AppTextStyles.body.copyWith(
                  fontSize: 14,
                  color: AppColors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
