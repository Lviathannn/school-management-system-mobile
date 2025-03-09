import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';
import 'package:school_management_system/modules/home/controllers/student_controller.dart';
import 'package:school_management_system/modules/home/models/saving_model.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:school_management_system/shared/themes/app_sizes.dart';
import 'package:school_management_system/shared/themes/app_texts.dart';
import 'package:school_management_system/shared/utils/utils.dart';
import 'package:school_management_system/shared/widgets/app_badge.dart';
import 'package:school_management_system/shared/widgets/empty_data.dart';

class SavingContent extends StatelessWidget {
  const SavingContent({super.key});

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

          if (controller.savings.isEmpty) {
            return const SliverToBoxAdapter(
                child: EmptyData(
              message: 'Tidak ada data tabungan',
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
                  return SavingItem(
                    saving: controller.savings[index],
                  );
                },
                childCount: controller.savings.length,
              ),
            ),
          );
        }),
      ],
    );
  }
}

class SavingItem extends StatelessWidget {
  final SavingModel saving;
  const SavingItem({super.key, required this.saving});

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
                DateFormat('dd MMMM yyyy').format(saving.created_at),
                style:
                    AppTextStyles.caption.copyWith(fontWeight: FontWeight.w600),
              ),
              AppBadge(
                backgroundColor: saving.type == "income"
                    ? AppColors.primary.withOpacity(0.1)
                    : AppColors.red.withOpacity(0.1),
                text: saving.type == "income" ? "Masuk" : "Keluar",
                color:
                    saving.type == "income" ? AppColors.primary : AppColors.red,
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
                      HugeIcon(
                        icon: HugeIcons.strokeRoundedBackpack02,
                        color: saving.type == "income"
                            ? AppColors.primary
                            : AppColors.red,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        saving.student,
                        style: AppTextStyles.body.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      HugeIcon(
                        icon: HugeIcons.strokeRoundedNoteAdd,
                        color: saving.type == "income"
                            ? AppColors.primary
                            : AppColors.red,
                        size: 16,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        saving.teacher,
                        style: AppTextStyles.body
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      HugeIcon(
                        icon: HugeIcons.strokeRoundedSchool,
                        color: saving.type == "income"
                            ? AppColors.primary
                            : AppColors.red,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      AppBadge(
                          text: "Kelas ${saving.student_class}",
                          color: saving.type == "income"
                              ? AppColors.primary
                              : AppColors.red,
                          backgroundColor: saving.type == "income"
                              ? AppColors.primary.withOpacity(0.1)
                              : AppColors.red.withOpacity(0.1)),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      HugeIcon(
                        icon: HugeIcons.strokeRoundedDollarSquare,
                        color: saving.type == "income"
                            ? AppColors.primary
                            : AppColors.red,
                        size: 16,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        formatRupiah(saving.total),
                        style: AppTextStyles.caption.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
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
