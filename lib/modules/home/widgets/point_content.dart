import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:school_management_system/shared/themes/app_sizes.dart';
import 'package:school_management_system/shared/themes/app_texts.dart';

class PointContent extends StatelessWidget {
  const PointContent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(AppSizes.paddingMedium),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'List Nilai Diberikan',
                  style: AppTextStyles.body
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      backgroundColor:
                          WidgetStateProperty.all(AppColors.primary),
                    ),
                    child: Row(
                      children: [
                        const HugeIcon(
                            icon: HugeIcons.strokeRoundedFilter,
                            color: AppColors.white,
                            size: 20),
                        const SizedBox(width: 5),
                        Text(
                          'Filter',
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppSizes.paddingMedium),
          sliver:
              SliverList(delegate: SliverChildBuilderDelegate((context, index) {
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
                        '01 Januari 2025',
                        style: AppTextStyles.caption
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: AppColors.yellow.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const HugeIcon(
                            icon: HugeIcons.strokeRoundedStar,
                            color: AppColors.yellow,
                            size: 16),
                      )
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
                                'Muhammad Asrul',
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
                                'Ibu Anin',
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
                              Text('Karena Bersikap Baik',
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
          })),
        ),
      ],
    );
  }
}
