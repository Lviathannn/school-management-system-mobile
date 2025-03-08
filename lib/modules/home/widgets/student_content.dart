import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school_management_system/modules/home/controllers/student_controller.dart';
import 'package:school_management_system/modules/home/models/student_model.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:school_management_system/shared/themes/app_images.dart';
import 'package:school_management_system/shared/themes/app_sizes.dart';
import 'package:school_management_system/shared/themes/app_texts.dart';
import 'package:school_management_system/shared/widgets/app_badge.dart';
import 'package:school_management_system/shared/widgets/empty_data.dart';
import 'package:school_management_system/shared/widgets/information.dart';

class StudentContent extends StatelessWidget {
  const StudentContent({super.key});

  @override
  Widget build(BuildContext context) {
    final StudentController studentController = Get.put(StudentController());

    return CustomScrollView(
      slivers: [
        Obx(() {
          if (studentController.isFetching.value) {
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

          if (studentController.students.isEmpty) {
            return const SliverToBoxAdapter(
                child: EmptyData(
              message: 'Tidak ada data siswa',
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
                  return StudentItem(
                    student: studentController.students[index],
                  );
                },
                childCount: studentController.students.length,
              ),
            ),
          );
        }),
      ],
    );
  }
}

class StudentItem extends StatelessWidget {
  final StudentModel student;
  const StudentItem({super.key, required this.student});

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
                    backgroundImage: student.profile_picture == null
                        ? AssetImage(
                            student.gender == "l"
                                ? AppImages.boy
                                : AppImages.girl,
                          )
                        : NetworkImage(student.profile_picture?.url ?? "")
                            as ImageProvider,
                    backgroundColor: AppColors.background,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        student.name,
                        style: AppTextStyles.body
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        student.nis,
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
                backgroundColor: student.student_class == "A"
                    ? AppColors.primary.withOpacity(0.1)
                    : AppColors.red.withOpacity(0.1),
                text: "Kelas ${student.student_class}",
                color: student.student_class == "A"
                    ? AppColors.primary
                    : AppColors.red,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Information(
                  title: "Tanggal Lahir",
                  child: Text(
                    DateFormat('dd MMMM yyyy').format(student.birth_date),
                    style: AppTextStyles.bodyBold,
                  )),
              Information(
                title: "Orang Tua",
                child: Text(
                  student.parent,
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
                Get.toNamed('/student-detail/${student.id}');
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
