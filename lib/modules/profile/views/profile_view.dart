import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:school_management_system/modules/profile/controllers/profile_controller.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:school_management_system/shared/themes/app_images.dart';
import 'package:school_management_system/shared/themes/app_texts.dart';
import 'package:intl/intl.dart';

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
    final ProfileController profileController = Get.put(
      ProfileController(),
    );
    final currentUser = profileController.currentUser;


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
              SizedBox(
                  width: 100,
                  height: 100,
                  child: Obx(() => profileController.isFetching.value
                      ? Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        )
                      : CircleAvatar(
                          backgroundColor: AppColors.primary.withOpacity(0.1),
                          radius: 50,
                          backgroundImage:
                              profileController.user.value!.url.isEmpty
                                  ? const AssetImage(
                                      AppImages.man,
                                    )
                                  : NetworkImage(
                                      profileController.user.value!.url,
                                    ),
                        ))),
              const SizedBox(height: 10),
              Obx(
                () => Text(
                  profileController.user.value?.name ?? "-",
                  style: AppTextStyles.bodyBold.copyWith(
                    fontSize: 20,
                    color: AppColors.text,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Aktif Sejak - ",
                    style: AppTextStyles.caption.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    DateFormat("MMM yyyy")
                        .format(DateTime.parse(currentUser!.createdAt)),
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
                "Informasi Pribadi",
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
                          icon: HugeIcons.strokeRoundedTeacher,
                          color: AppColors.textLight,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "Jabatan",
                          style: AppTextStyles.caption.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => Text(
                        profileController.user.value?.role == "Kepala"
                            ? "Kepala Sekolah"
                            : profileController.user.value?.role == "TU"
                                ? "Tata Usaha"
                                : profileController.user.value?.role == "A"
                                    ? "Guru Kelas A"
                                    : "Guru Kelas B",
                        style: AppTextStyles.caption.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ),
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
                      currentUser.email ?? "",
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
                          icon: HugeIcons.strokeRoundedSmartPhone01,
                          color: AppColors.textLight,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "Kontak",
                          style: AppTextStyles.caption.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => Text(
                        profileController.user.value?.phone ?? "-",
                        style: AppTextStyles.caption.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
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
                          icon: HugeIcons.strokeRoundedLocation01,
                          color: AppColors.textLight,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "Alamat",
                          style: AppTextStyles.caption.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Obx(
                        () => Text(profileController.user.value?.address ?? "-",
                            style: AppTextStyles.caption.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.end,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true),
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

                Get.dialog(AlertDialog(
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
                                child: Obx(
                                  () => TextButton(
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
                                    onPressed: profileController.isLoading.value
                                        ? null
                                        : () {
                                            Get.back();
                                          },
                                    child: profileController.isLoading.value
                                        ? const SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              color: AppColors.primary,
                                            ),
                                          )
                                        : const Text(
                                            "Batal",
                                            style: TextStyle(
                                              color: AppColors.text,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                  ),
                                )),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: Obx(() => TextButton(
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      backgroundColor: profileController
                                              .isLoading.value
                                          ? AppColors.primary.withOpacity(0.5)
                                          : AppColors.primary,
                                      foregroundColor:
                                          Colors.white, // Warna teks
                                    ),
                                    onPressed: profileController.isLoading.value
                                        ? null
                                        : () {
                                            profileController.logout();
                                          },
                                    child: profileController.isLoading.value
                                        ? const SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              color: AppColors.white,
                                            ),
                                          )
                                        : const Text(
                                            "Keluar",
                                            style: TextStyle(
                                              color: AppColors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ));
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
