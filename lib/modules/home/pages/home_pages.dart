import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:school_management_system/modules/home/widgets/best_student_list.dart';
import 'package:school_management_system/modules/home/widgets/dashboard_card.dart';
import 'package:school_management_system/modules/home/widgets/income_chart.dart';
import 'package:school_management_system/modules/home/widgets/saving_chart.dart';
import 'package:school_management_system/shared/constant/best_student.dart';
import 'package:school_management_system/shared/constant/dashboard_card.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:school_management_system/shared/themes/app_sizes.dart';
import 'package:school_management_system/shared/widgets/title_icon.dart';

class HomePages extends StatelessWidget {
  const HomePages({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(
            top: AppSizes.paddingMedium,
            left: AppSizes.paddingMedium,
            right: AppSizes.paddingMedium,
          ),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final card = dashboardCards[index];
                return Column(
                  children: [
                    DashboardCard(
                      title: card.title,
                      subtitle: card.subtitle,
                      description: card.description,
                      value: card.value,
                      color: card.color,
                      icon: card.icon,
                    ),
                    if (index < dashboardCards.length - 1)
                      const SizedBox(height: AppSizes.paddingSmall),
                  ],
                );
              },
              childCount: dashboardCards.length,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(
            top: AppSizes.paddingSmall,
            left: AppSizes.paddingMedium,
            right: AppSizes.paddingMedium,
          ),
          sliver: SliverToBoxAdapter(
            child: Container(
                padding: const EdgeInsets.all(AppSizes.paddingMedium),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    TitleIcon(
                      title: 'Pendapatan',
                      icon: HugeIcons.strokeRoundedTradeUp,
                      color: AppColors.emerald,
                      subtitle: 'Dalam 1 Tahun',
                    ),
                    SizedBox(height: AppSizes.paddingMedium),
                    SizedBox(
                      height: 200,
                      child: IncomeChart(
                        color: AppColors.emerald,
                        incomeData: [
                          500000,
                          700000,
                          600000,
                          800000,
                          750000,
                          850000,
                          900000,
                          950000,
                          1100000,
                          1000000,
                          1200000,
                          700000,
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(
            top: AppSizes.paddingSmall,
            left: AppSizes.paddingMedium,
            right: AppSizes.paddingMedium,
          ),
          sliver: SliverToBoxAdapter(
            child: Container(
                padding: const EdgeInsets.all(AppSizes.paddingMedium),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    TitleIcon(
                      title: 'Pengeluaran',
                      icon: HugeIcons.strokeRoundedTradeDown,
                      color: AppColors.red,
                      subtitle: 'Dalam 1 Tahun',
                    ),
                    SizedBox(height: AppSizes.paddingMedium),
                    SizedBox(
                      height: 200,
                      child: IncomeChart(
                        color: AppColors.red,
                        incomeData: [
                          500000,
                          700000,
                          600000,
                          800000,
                          750000,
                          850000,
                          900000,
                          950000,
                          1100000,
                          1000000,
                          1200000,
                          700000,
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(
            top: AppSizes.paddingSmall,
            left: AppSizes.paddingMedium,
            right: AppSizes.paddingMedium,
          ),
          sliver: SliverToBoxAdapter(
            child: Container(
                padding: const EdgeInsets.all(AppSizes.paddingMedium),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
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
                  children: [
                    const TitleIcon(
                      title: 'Siswa Berprestasi',
                      icon: HugeIcons.strokeRoundedChampion,
                      color: AppColors.yellow,
                      subtitle: 'Dalam 1 Tahun',
                    ),
                    const SizedBox(height: AppSizes.paddingMedium),
                    ...bestStudents.map((student) {
                      return BestStudentList(
                        student: student,
                      );
                    }),
                  ],
                )),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(
            top: AppSizes.paddingSmall,
            left: AppSizes.paddingMedium,
            right: AppSizes.paddingMedium,
          ),
          sliver: SliverToBoxAdapter(
            child: Container(
                margin: const EdgeInsets.only(bottom: AppSizes.paddingMedium),
                padding: const EdgeInsets.all(AppSizes.paddingMedium),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    TitleIcon(
                      title: 'Tabungan',
                      icon: HugeIcons.strokeRoundedTradeUp,
                      color: AppColors.sky,
                      subtitle: 'Dalam 1 Semester',
                    ),
                    SizedBox(height: AppSizes.paddingLarge),
                    SizedBox(height: 150, child: SavingChart()),
                  ],
                )),
          ),
        ),
      ],
    );
  }
}

