import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:school_management_system/shared/themes/app_images.dart';
import 'package:school_management_system/shared/themes/app_sizes.dart';
import 'package:school_management_system/shared/themes/app_texts.dart';
import 'package:school_management_system/shared/widgets/app_badge.dart';
import 'package:school_management_system/shared/widgets/attachment.dart';
import 'package:school_management_system/shared/widgets/information.dart';
import 'package:school_management_system/shared/widgets/title_banner.dart';

class TeacherDetail extends StatelessWidget {
  const TeacherDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          shadowColor: Colors.transparent,
          foregroundColor: AppColors.text,
          surfaceTintColor: AppColors.white,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const HugeIcon(
                    icon: HugeIcons.strokeRoundedArrowLeft01,
                    color: AppColors.text),
              ),
              Text(
                "Detail Guru",
                style: AppTextStyles.body.copyWith(
                  color: AppColors.text,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox()
            ],
          ),
        ),
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(AppSizes.paddingMedium),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(AppSizes.borderRadius),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleBanner(text: "Informasi Guru"),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          const SizedBox(
                            width: 65,
                            height: 65,
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(AppImages.man),
                            ),
                          ),
                          const SizedBox(width: 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'John Doe',
                                style: AppTextStyles.subtitle.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              AppBadge(
                                  text: "Kelas A",
                                  color: AppColors.primary,
                                  backgroundColor:
                                      AppColors.primary.withOpacity(0.1))
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                      const Information(
                        title: "Nomor Induk Guru",
                        child: Text(
                          "1234567890",
                          style: AppTextStyles.bodyBold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Information(
                        title: "NIK",
                        child: Text(
                          "1234567890",
                          style: AppTextStyles.bodyBold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Information(
                        title: "Tempat, Tanggal Lahir",
                        child: Text(
                          "Jakarta, 01 Januari 2000",
                          style: AppTextStyles.bodyBold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Information(
                        title: "Pendidikan Terakhir",
                        child: Text(
                          "Strata 1",
                          style: AppTextStyles.bodyBold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Information(
                        title: "Alamat",
                        child: Text(
                          "Jl. Kebon Jeruk No. 1, Jakarta Barat",
                          style: AppTextStyles.bodyBold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Information(
                        title: "Kontak",
                        child: Text(
                          "081234567890",
                          style: AppTextStyles.bodyBold,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 25,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(AppSizes.paddingMedium),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(AppSizes.borderRadius),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleBanner(text: "Lampiran Guru"),
                      SizedBox(height: 30),
                      Attachment(
                        url: "",
                        title: "Foto Guru",
                        icon: HugeIcons.strokeRoundedBackpack01,
                        color: AppColors.emerald,
                      ),
                      SizedBox(height: 10),
                      Attachment(
                        url: "",

                        title: "Kartu Keluarga",
                        icon: HugeIcons.strokeRoundedIdentityCard,
                        color: AppColors.indigo,
                      ),
                      SizedBox(height: 10),
                      Attachment(
                        url: "",
                        title: "KTP",
                        icon: HugeIcons.strokeRoundedManager,
                        color: AppColors.red,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 25,
              ),
            ),
          ],
        ));
  }
}
