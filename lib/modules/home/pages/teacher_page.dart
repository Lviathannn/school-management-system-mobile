import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';
import 'package:school_management_system/modules/home/controllers/teacher_controller.dart';
import 'package:school_management_system/modules/home/models/dropdown_option.dart';
import 'package:school_management_system/modules/home/models/teacher_model.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:school_management_system/shared/themes/app_images.dart';
import 'package:school_management_system/shared/themes/app_sizes.dart';
import 'package:school_management_system/shared/themes/app_texts.dart';
import 'package:school_management_system/shared/widgets/app_badge.dart';
import 'package:school_management_system/shared/widgets/empty_data.dart';
import 'package:school_management_system/shared/widgets/information.dart';

class TeacherPage extends StatelessWidget {
  const TeacherPage({super.key});

  @override
  Widget build(BuildContext context) {
    TeacherController controller = Get.put(TeacherController());

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        toolbarHeight: 100,
        title: Column(
          children: [
            TextField(
              style: const TextStyle(color: AppColors.textLight, fontSize: 14),
              cursorColor: AppColors.primary,
              onChanged: (value) {
                controller.searchText.value = value;
              },
              decoration: InputDecoration(
                hintText: 'Cari Guru',
                hintStyle:
                    const TextStyle(color: AppColors.textLight, fontSize: 14),
                prefixIcon: const Icon(
                  HugeIcons.strokeRoundedSearch01,
                  size: 20,
                  color: AppColors.textLight,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    width: 1.5,
                    color: AppColors.primary,
                  ),
                ),
                focusColor: AppColors.primary,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: AppColors.background,
                suffixIcon: IconButton(
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                    ),
                    child: const Icon(
                      HugeIcons.strokeRoundedSettings04,
                      color: AppColors.textLight,
                    ),
                  ),
                  onPressed: () {
                    _displayBottomSheet(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          Obx(() {
            if (controller.isFetching.value) {
              return SliverToBoxAdapter(
                child: SizedBox(
                  height: Get.height - 250,
                  child: const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(AppColors.primary),
                      strokeWidth: 3,
                    ),
                  ),
                ),
              );
            }

            if (controller.teachers.isEmpty) {
              return const SliverToBoxAdapter(
                  child: EmptyData(
                message: 'Tidak ada data',
              ));
            }

            return SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.paddingMedium,
                vertical: AppSizes.paddingMedium,
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return TeacherItem(
                      teacher: controller.teachers[index],
                    );
                  },
                  childCount: controller.teachers.length,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Future _displayBottomSheet(BuildContext context) {
    TeacherController controller = Get.find<TeacherController>();

    final roleOption = [
      DropdownOption(label: "Semua Jabatan", value: ""),
      DropdownOption(label: "Kepala Sekolah", value: "Kepala"),
      DropdownOption(label: "Tata Usaha", value: "TU"),
      DropdownOption(label: "Guru Kelas A", value: "A"),
      DropdownOption(label: "Guru Kelas B", value: "B"),
    ];

    final genderOption = [
      DropdownOption(value: "", label: "Semua Gender"),
      DropdownOption(value: "p", label: "Perempuan"),
      DropdownOption(value: "l", label: "Laki laki"),
    ];

    final degreeOption = [
      DropdownOption(value: "", label: "Semua Pendidikan"),
      DropdownOption(value: "Strata 3", label: "Strata 3"),
      DropdownOption(value: "Strata 2", label: "Strata 2"),
      DropdownOption(value: "Strata 1", label: "Strata 1"),
      DropdownOption(value: "SMA", label: "SMA"),
      DropdownOption(value: "SMP", label: "SMP"),
      DropdownOption(value: "SD", label: "SD"),
    ];

    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (BuildContext context) {
        return Obx(() => Container(
              width: double.infinity,
              height: 420,
              padding: const EdgeInsets.all(AppSizes.paddingLarge),
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text("Filter",
                              style: TextStyle(
                                color: AppColors.text,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              )),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              controller.resetFilter();
                              Get.back();
                            },
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              foregroundColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              "Reset",
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Kelas",
                        style: TextStyle(
                          color: AppColors.text,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: double.infinity,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            isExpanded: true,
                            buttonStyleData: ButtonStyleData(
                              padding: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: AppColors.background,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                HugeIcons.strokeRoundedArrowDown01,
                                color: AppColors.textLight,
                              ),
                            ),
                            dropdownStyleData: DropdownStyleData(
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                            ),
                            style: const TextStyle(
                                color: AppColors.textLight, fontSize: 14),
                            value: controller.temporaryRoleFilter.value,
                            items: roleOption.map((value) {
                              return DropdownMenuItem(
                                value: value.value,
                                child: Text(
                                  value.label,
                                  style: const TextStyle(
                                    color: AppColors.text,
                                    fontSize: 14,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              controller.temporaryRoleFilter.value =
                                  value.toString();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Gender",
                        style: TextStyle(
                          color: AppColors.text,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: double.infinity,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            isExpanded: true,
                            buttonStyleData: ButtonStyleData(
                              padding: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: AppColors.background,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                HugeIcons.strokeRoundedArrowDown01,
                                color: AppColors.textLight,
                              ),
                            ),
                            dropdownStyleData: DropdownStyleData(
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                            ),
                            style: const TextStyle(
                                color: AppColors.textLight, fontSize: 14),
                            value: controller.temporaryGenderFilter.value,
                            items: genderOption.map((value) {
                              return DropdownMenuItem(
                                value: value.value,
                                child: Text(
                                  value.label,
                                  style: const TextStyle(
                                    color: AppColors.text,
                                    fontSize: 14,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              controller.temporaryGenderFilter.value =
                                  value.toString();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Pendidikan Terakhir",
                        style: TextStyle(
                          color: AppColors.text,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: double.infinity,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            isExpanded: true,
                            buttonStyleData: ButtonStyleData(
                              padding: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: AppColors.background,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                HugeIcons.strokeRoundedArrowDown01,
                                color: AppColors.textLight,
                              ),
                            ),
                            dropdownStyleData: DropdownStyleData(
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                            ),
                            style: const TextStyle(
                                color: AppColors.textLight, fontSize: 14),
                            value: controller.temporaryDegreeFilter.value,
                            items: degreeOption.map((value) {
                              return DropdownMenuItem(
                                value: value.value,
                                child: Text(
                                  value.label,
                                  style: const TextStyle(
                                    color: AppColors.text,
                                    fontSize: 14,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              controller.temporaryDegreeFilter.value =
                                  value.toString();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        controller.genderFilter.value =
                            controller.temporaryGenderFilter.value;
                        controller.roleFilter.value =
                            controller.temporaryRoleFilter.value;
                        controller.degreeFilter.value =
                            controller.temporaryDegreeFilter.value;
                        controller.fetchAllTeacher();
                        Get.back();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Terapkan",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}

// ignore: must_be_immutable
class TeacherItem extends StatelessWidget {
  TeacherModel teacher;
  TeacherItem({super.key, required this.teacher});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSizes.paddingMedium),
      padding: const EdgeInsets.all(AppSizes.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.text.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    foregroundImage: teacher.profile_picture == null
                        ? AssetImage(
                            teacher.gender == "l"
                                ? AppImages.man
                                : AppImages.woman,
                          )
                        : NetworkImage(teacher.profile_picture?.url ?? "")
                            as ImageProvider,
                    backgroundColor: AppColors.background,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        teacher.name,
                        style: AppTextStyles.body
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        teacher.nip,
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.textLight,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              AppBadge(
                text: teacher.role == "Kepala"
                    ? "Kepala Sekolah"
                    : teacher.role == "TU"
                        ? "Tata Usaha"
                        : teacher.role == "A"
                            ? "Guru Kelas A"
                            : "Guru Kelas B",
                color: teacher.role == "Kepala"
                    ? AppColors.emerald
                    : teacher.role == "TU"
                        ? AppColors.indigo
                        : teacher.role == "A"
                            ? AppColors.primary
                            : AppColors.red,
                backgroundColor: teacher.role == "Kepala"
                    ? AppColors.emerald.withOpacity(0.1)
                    : teacher.role == "TU"
                        ? AppColors.indigo.withOpacity(0.1)
                        : teacher.role == "A"
                            ? AppColors.primary.withOpacity(0.1)
                            : AppColors.red.withOpacity(0.1),
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Information(
                title: "Tanggal Lahir",
                child: Text(
                  DateFormat('dd MMMM yyyy').format(teacher.birth_date),
                  style: AppTextStyles.bodyBold,
                ),
              ),
              Information(
                title: "Pendidikan",
                child: Text(
                  teacher.degree,
                  style: AppTextStyles.bodyBold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 40,
            child: TextButton(
              onPressed: () {
                Get.toNamed('/teacher-detail/${teacher.id}');
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(AppColors.primary),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              child: Text(
                'Lihat Detail',
                style: AppTextStyles.caption.copyWith(color: AppColors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
