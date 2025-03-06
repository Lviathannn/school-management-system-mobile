import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';
import 'package:school_management_system/modules/teacher_detail/controllers/teacher_detail_controller.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:school_management_system/shared/themes/app_images.dart';
import 'package:school_management_system/shared/themes/app_sizes.dart';
import 'package:school_management_system/shared/themes/app_texts.dart';
import 'package:school_management_system/shared/widgets/app_badge.dart';
import 'package:school_management_system/shared/widgets/attachment.dart';
import 'package:school_management_system/shared/widgets/information.dart';
import 'package:school_management_system/shared/widgets/title_banner.dart';
import 'package:shimmer/shimmer.dart';

class TeacherDetail extends StatelessWidget {
  const TeacherDetail({super.key});

  @override
  Widget build(BuildContext context) {
    TeacherDetailController controller = Get.put(TeacherDetailController());

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
                  : SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          padding: const EdgeInsets.all(AppSizes.paddingMedium),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.circular(AppSizes.borderRadius),
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
                                  SizedBox(
                                    width: 65,
                                    height: 65,
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundImage: controller.teacher.value
                                                  ?.profile_picture?.url ==
                                              null
                                          ? AssetImage(
                                              controller.teacher.value
                                                          ?.gender ==
                                                      "l"
                                                  ? AppImages.man
                                                  : AppImages.woman,
                                            )
                                          : NetworkImage(
                                              controller.teacher.value
                                                      ?.profile_picture?.url ??
                                                  "",
                                            ) as ImageProvider,
                                      backgroundColor: AppColors.background,
                                    ),
                                  ),
                                  const SizedBox(width: 30),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child: Text(
                                          controller.teacher.value?.name ?? "",
                                          style:
                                              AppTextStyles.subtitle.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      AppBadge(
                                        text: controller.teacher.value?.role ==
                                                "Kepala"
                                            ? "Kepala Sekolah"
                                            : controller.teacher.value?.role ==
                                                    "TU"
                                                ? "Tata Usaha"
                                                : controller.teacher.value
                                                            ?.role ==
                                                        "A"
                                                    ? "Guru Kelas A"
                                                    : "Guru Kelas B",
                                        color: controller.teacher.value?.role ==
                                                "Kepala"
                                            ? AppColors.emerald
                                            : controller.teacher.value?.role ==
                                                    "TU"
                                                ? AppColors.indigo
                                                : controller.teacher.value
                                                            ?.role ==
                                                        "A"
                                                    ? AppColors.primary
                                                    : AppColors.red,
                                        backgroundColor: controller
                                                    .teacher.value?.role ==
                                                "Kepala"
                                            ? AppColors.emerald.withOpacity(0.1)
                                            : controller.teacher.value?.role ==
                                                    "TU"
                                                ? AppColors.indigo
                                                    .withOpacity(0.1)
                                                : controller.teacher.value
                                                            ?.role ==
                                                        "A"
                                                    ? AppColors.primary
                                                        .withOpacity(0.1)
                                                    : AppColors.red
                                                        .withOpacity(0.1),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(height: 30),
                              Information(
                                title: "Nomor Induk Guru",
                                child: Text(
                                  controller.teacher.value?.nip ?? "",
                                  style: AppTextStyles.bodyBold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Information(
                                title: "NIK",
                                child: Text(
                                  controller.teacher.value?.nik ?? "",
                                  style: AppTextStyles.bodyBold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Information(
                                title: "Tempat, Tanggal Lahir",
                                child: Text(
                                  "${controller.teacher.value?.birth_place}, ${DateFormat('dd MMMM yyyy').format(
                                    controller.teacher.value?.birth_date ??
                                        DateTime.now(),
                                  )}",
                                  style: AppTextStyles.bodyBold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Information(
                                title: "Pendidikan Terakhir",
                                child: Text(
                                  controller.teacher.value?.degree ?? "",
                                  style: AppTextStyles.bodyBold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Information(
                                title: "Alamat",
                                child: Text(
                                  controller.teacher.value?.address ?? "",
                                  style: AppTextStyles.bodyBold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Information(
                                title: "Kontak",
                                child: Text(
                                  controller.teacher.value?.contact ?? "",
                                  style: AppTextStyles.bodyBold,
                                ),
                              ),
                              const SizedBox(height: 20),
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
                            borderRadius:
                                BorderRadius.circular(AppSizes.borderRadius),
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
                              const TitleBanner(text: "Lampiran Guru"),
                              const SizedBox(height: 30),
                              Obx(
                                () => Attachment(
                                  title: "Foto Guru",
                                  icon: HugeIcons.strokeRoundedUser,
                                  color: AppColors.primary,
                                  url: controller.teacher.value?.profile_picture
                                          ?.url ??
                                      "",
                                ),
                              ),
                              Obx(
                                () => Column(
                                  children: controller.teacher.value?.attachment
                                          .map(
                                            (e) => Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
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
                                                        ? HugeIcons
                                                            .strokeRoundedManager
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
