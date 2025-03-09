import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';
import 'package:school_management_system/modules/home/controllers/student_controller.dart';
import 'package:school_management_system/modules/home/models/star_model.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:school_management_system/shared/themes/app_sizes.dart';
import 'package:school_management_system/shared/themes/app_texts.dart';
import 'package:school_management_system/shared/widgets/app_badge.dart';
import 'package:school_management_system/shared/widgets/empty_data.dart';

class PointContent extends StatelessWidget {
  const PointContent({super.key});

  @override
  Widget build(BuildContext context) {
    StudentController controller = Get.find();

    return CustomScrollView(
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

          if (controller.star.isEmpty) {
            return const SliverToBoxAdapter(
                child: EmptyData(
              message: 'Tidak ada data nilai',
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
                  return StarItem(
                    star: controller.star[index],
                  );
                },
                childCount: controller.star.length,
              ),
            ),
          );
        }),
      ],
    );
  }
}

class StarItem extends StatelessWidget {
  final StarModel star;
  const StarItem({super.key, required this.star});

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
              Text(
                DateFormat('dd MMMM yyyy').format(star.created_at),
                style:
                    AppTextStyles.caption.copyWith(fontWeight: FontWeight.w600),
              ),
              AppBadge(
                backgroundColor: star.student_class == "A"
                    ? AppColors.primary.withOpacity(0.1)
                    : AppColors.red.withOpacity(0.1),
                text: "Kelas ${star.student_class}",
                color: star.student_class == "A"
                    ? AppColors.primary
                    : AppColors.red,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const HugeIcon(
                        icon: HugeIcons.strokeRoundedBackpack02,
                        color: AppColors.primary,
                        size: 16,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        star.student,
                        style: AppTextStyles.body
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const HugeIcon(
                        icon: HugeIcons.strokeRoundedPencilEdit01,
                        color: AppColors.primary,
                        size: 16,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        star.teacher,
                        style: AppTextStyles.body
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const HugeIcon(
                        icon: HugeIcons.strokeRoundedNote03,
                        color: AppColors.primary,
                        size: 16,
                      ),
                      const SizedBox(width: 5),
                      Text(star.reason,
                          style: AppTextStyles.caption.copyWith(
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
