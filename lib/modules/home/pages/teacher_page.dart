import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:school_management_system/shared/themes/app_sizes.dart';
import 'package:school_management_system/shared/themes/app_texts.dart';

class TeacherPage extends StatelessWidget {
  const TeacherPage({super.key});

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
                  'List Seluruh Guru',
                  style: AppTextStyles.body
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
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
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                AssetImage('assets/images/teacher-man.png'),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tanggal Lahir',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.textLight,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '01 Oktober 2001',
                            style: AppTextStyles.body.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pendidikan Terakhir',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.textLight,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'S1',
                            style: AppTextStyles.body.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 30,
                    child: TextButton(
                      onPressed: () {},
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
    );
  }
}
