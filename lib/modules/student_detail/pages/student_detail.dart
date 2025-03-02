import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';
import 'package:school_management_system/modules/student_detail/controllers/student_detail_controller.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:school_management_system/shared/themes/app_images.dart';
import 'package:school_management_system/shared/themes/app_sizes.dart';
import 'package:school_management_system/shared/themes/app_texts.dart';
import 'package:school_management_system/shared/widgets/app_badge.dart';
import 'package:school_management_system/shared/widgets/attachment.dart';
import 'package:school_management_system/shared/widgets/information.dart';
import 'package:school_management_system/shared/widgets/information_icon.dart';
import 'package:school_management_system/shared/widgets/title_banner.dart';
import 'package:shimmer/shimmer.dart';

class StudentDetail extends StatelessWidget {
  const StudentDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final StudentDetailController controller = Get.put(
      StudentDetailController(),
    );

    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          shadowColor: Colors.transparent,
          foregroundColor: AppColors.text,
          surfaceTintColor: AppColors.white,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const HugeIcon(
                    icon: HugeIcons.strokeRoundedArrowLeft01,
                    color: AppColors.text,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Detail Siswa",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.text,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 40), 
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
            Obx(
              () => controller.isFetching.value
                  ? SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          width: double.infinity,
                          height: 800,
                          child: Shimmer.fromColors(
                            baseColor: AppColors.textLight.withOpacity(0.1),
                            highlightColor:
                                AppColors.textLight.withOpacity(0.25),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.background,
                                borderRadius: BorderRadius.circular(
                                    AppSizes.borderRadius),
                              ),
                              width: double.infinity,
                              height: 300,
                            ),
                          ),
                        ),
                      ),
                    )
                  : 
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
                      const TitleBanner(text: "Informasi Siswa"),
                      const SizedBox(height: 30),
                              Row(
                          children: [
                            SizedBox(
                              width: 65,
                              height: 65,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundImage: controller.student.value
                                            ?.profile_picture?.url ==
                                        null
                                    ? AssetImage(
                                        controller.student.value?.gender == "l"
                                            ? AppImages.boy
                                            : AppImages.girl,
                                      )
                                    : NetworkImage(
                                        controller.student.value
                                                ?.profile_picture?.url ??
                                            "",
                                      ) as ImageProvider,
                                backgroundColor: AppColors.background,
                              ),
                            ),
                            const SizedBox(width: 30),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.student.value?.name ?? "",
                                  style: AppTextStyles.subtitle.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                AppBadge(
                                  backgroundColor:
                                      controller.student.value?.student_class ==
                                              "A"
                                          ? AppColors.primary.withOpacity(0.1)
                                          : AppColors.red.withOpacity(0.1),
                                  text:
                                      "Kelas ${controller.student.value?.student_class}",
                                  color:
                                      controller.student.value?.student_class ==
                                              "A"
                                          ? AppColors.primary
                                          : AppColors.red,
                                ),
                              ],
                            )
                                ],
                              ),
                      const SizedBox(height: 30),
                              Information(
                        title: "Nomor Induk Siswa",
                        child: Text(
                            controller.student.value?.nis ?? "",
                          style: AppTextStyles.bodyBold,
                        ),
                              ),
                      const SizedBox(height: 20),
                              Information(
                          title: "NIK",
                          child: Text(
                            controller.student.value?.nik ?? "",
                            style: AppTextStyles.bodyBold,
                          ),
                              ),
                      const SizedBox(height: 20),
                              Information(
                          title: "Tanggal Lahir",
                          child: Text(
                            "${controller.student.value?.birth_place}, ${DateFormat('dd MMMM yyyy').format(
                              controller.student.value?.birth_date ??
                                  DateTime.now(),
                            )}",
                            style: AppTextStyles.bodyBold,
                          ),
                              ),
                      const SizedBox(height: 20),
                              Information(
                          title: "Orang Tua",
                          child: Text(
                            controller.student.value?.parent ?? "",
                            style: AppTextStyles.bodyBold,
                          ),
                              ),
                      const SizedBox(height: 20),
Information(
                          title: "Alamat",
                          child: Text(
                            controller.student.value?.address ?? "",
                            style: AppTextStyles.bodyBold,
                                ),
                              ),
                     
                      const SizedBox(height: 20),
                              Information(
                          title: "Kontak Orang Tua",
                          child: Text(
                            controller.student.value?.contact ?? "",
                            style: AppTextStyles.bodyBold,
                                ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(AppSizes.paddingSmall),
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius:
                              BorderRadius.circular(AppSizes.borderRadius),
                        ),
                        child: const InformationIcon(
                          title: "Tabungan",
                          icon: HugeIcons.strokeRoundedBank,
                          color: AppColors.primary,
                          subtitle: "Rp 1.000.000",
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(AppSizes.paddingSmall),
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius:
                              BorderRadius.circular(AppSizes.borderRadius),
                        ),
                        child: const InformationIcon(
                          title: "Nilai",
                          icon: HugeIcons.strokeRoundedChampion,
                          color: AppColors.yellow,
                          subtitle: "10 Bintang",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ),
            
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 25,
              ),
            ),

            Obx(
              () => controller.isFetching.value
                  ? SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          width: double.infinity,
                          height: 300,
                          child: Shimmer.fromColors(
                            baseColor: AppColors.textLight.withOpacity(0.1),
                            highlightColor:
                                AppColors.textLight.withOpacity(0.25),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.background,
                                borderRadius: BorderRadius.circular(
                                    AppSizes.borderRadius),
                              ),
                              width: double.infinity,
                              height: 300,
                            ),
                          ),
                        ),
                      ),
                    )
                  : SliverToBoxAdapter(
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
                      const TitleBanner(text: "Lampiran Siswa"),
                      const SizedBox(height: 30),
                      Obx(
                        () => Attachment(
                        title: "Foto Siswa",
                        icon: HugeIcons.strokeRoundedBackpack01,
                        color: AppColors.emerald,
                          url: controller.student.value?.profile_picture?.url ??
                              "",
                        ),
                      ),
                      Obx(
                        () => Column(
                          children: controller.student.value?.attachment
                                  .map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Attachment(
                                        url: e.url,
                                        title: e.type == "kk"
                                            ? "Kartu Keluarga"
                                            : e.type == "ktp"
                                                ? "KTP"
                                                : "Ijazah",
                                        icon: e.type == "kk"
                                            ? HugeIcons
                                                .strokeRoundedIdentityCard
                                            : e.type == "ktp"
                                                ? HugeIcons.strokeRoundedManager
                                                : HugeIcons
                                                    .strokeRoundedDiploma,
                                        color: e.type == "kk"
                                            ? AppColors.indigo
                                            : e.type == "ktp"
                                                ? AppColors.red
                                                : AppColors.emerald,
                                      ),
                                    ),
                                  )
                                  .toList() ??
                              [],
                        ),
                      ),
                    ],
                  ),
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
