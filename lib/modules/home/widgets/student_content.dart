import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:school_management_system/shared/themes/app_sizes.dart';
import 'package:school_management_system/shared/themes/app_texts.dart';
import 'package:school_management_system/shared/widgets/information.dart';

class StudentContent extends StatelessWidget {
  const StudentContent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding:
              const EdgeInsets.symmetric(
              horizontal: AppSizes.paddingMedium,
              vertical: AppSizes.paddingMedium),
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
                                AssetImage('assets/images/boy.png'),
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
                            '17 Agustus 2003',
                            style: AppTextStyles.bodyBold,
                          )),
                      Information(
                        title: "Orang Tua",
                        child: Text(
                            'Anwar Sanusi',
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
                        Get.toNamed('/student-detail/1');
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
    );
  }
}
