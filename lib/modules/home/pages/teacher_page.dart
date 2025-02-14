import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:school_management_system/shared/themes/app_images.dart';
import 'package:school_management_system/shared/themes/app_sizes.dart';
import 'package:school_management_system/shared/themes/app_texts.dart';
import 'package:school_management_system/shared/widgets/information.dart';

class TeacherPage extends StatelessWidget {
  const TeacherPage({super.key});

  @override
  Widget build(BuildContext context) {
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
          SliverPadding(
            padding:
                const EdgeInsets.all(AppSizes.paddingMedium),
            sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
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
                            const CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage(AppImages.man),
                              backgroundColor: AppColors.background,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Muhammad Asrul',
                                  style: AppTextStyles.body
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '3207180110010001',
                                  style: AppTextStyles.caption.copyWith(
                                    color: AppColors.textLight,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            'Kelas A',
                            style: AppTextStyles.body.copyWith(
                                color: AppColors.primary,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Information(
                          title: "Tanggal Lahir",
                          child: Text(
                            "01 Oktober 2001",
                            style: AppTextStyles.bodyBold,
                          ),
                        ),
                        Information(
                          title: "Pendidikan",
                          child: Text(
                            "Strata 1",
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
                          Get.toNamed('/teacher-detail/1');
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(AppColors.primary),
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        child: Text(
                          'Lihat Detail',
                          style: AppTextStyles.caption
                              .copyWith(color: AppColors.white),
                        ),
                      ),
                    )
                  ],
                ),
              );
            })),
          ),
        ],
      ),
    );
  }

  Future _displayBottomSheet(BuildContext context) {
    final classOption = [
      "Semua Kelas",
      "Kelas A",
      "Kelas B",
    ];

    final genderOption = [
      "Semua Gender",
      "Laki - Laki",
      "Perempuan",
    ];

    final degreeOption = [
      "Semua Pendidikan",
      "Strata 3",
      "Strata 2",
      "Strata 1",
      "Diploma 3",
      "SMA",
      "SMP",
      "SD",
    ];

    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          height: 360,
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
                        value: classOption[0],
                        items: classOption.map((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                color: AppColors.text,
                                fontSize: 14,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {},
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
                        value: genderOption[0],
                        items: genderOption.map((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                color: AppColors.text,
                                fontSize: 14,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {},
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
                        value: degreeOption[0],
                        items: degreeOption.map((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                color: AppColors.text,
                                fontSize: 14,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {},
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
        );
      },
    );
  }

}
