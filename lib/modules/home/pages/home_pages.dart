import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:school_management_system/modules/home/controllers/home_controller.dart';
import 'package:school_management_system/modules/home/widgets/dashboard_card.dart';
import 'package:school_management_system/modules/home/widgets/income_chart.dart';
import 'package:school_management_system/modules/home/widgets/saving_chart.dart';
import 'package:school_management_system/shared/constant/dashboard_card.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:school_management_system/shared/themes/app_sizes.dart';
import 'package:school_management_system/shared/utils/utils.dart';
import 'package:school_management_system/shared/widgets/title_icon.dart';

class HomePages extends StatelessWidget {
  const HomePages({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    
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
                    Obx(
                      () => DashboardCard(
                        isFetching: homeController.isSummaryFetching.value,
                      title: card.title,
                      subtitle: card.subtitle,
                      description: card.description,
                        value: card.title == "Siswa"
                            ? homeController
                                .dashboardSummary.value?.totalStudents
                                .toString()
                            : card.title == "Guru"
                                ? homeController
                                    .dashboardSummary.value?.totalTeachers
                                    .toString()
                                : card.title == "Tabungan"
                                    ? formatRupiah(homeController
                                        .dashboardSummary.value?.totalIncomes)
                                    : "-",
                      color: card.color,
                      icon: card.icon,
                      ),
                    ),
                    if (index < dashboardCards.length - 1)
                      const SizedBox(height: AppSizes.paddingSmall),
                  ],
                );
              },
              childCount: 3,
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
                child: Column(
                  children: [
                    const TitleIcon(
                      title: 'Pendapatan',
                      icon: HugeIcons.strokeRoundedTradeUp,
                      color: AppColors.emerald,
                      subtitle: 'Dalam 1 Tahun',
                    ),
                    const SizedBox(height: AppSizes.paddingMedium),
                    Obx(
                      () => SizedBox(
                        height: 200,
                        child: IncomeChart(
                          color: AppColors.emerald,
                          incomeData: homeController.monthlyIncome.value,
                        ),
                      ),
                    )
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
                      title: 'Pengeluaran',
                      icon: HugeIcons.strokeRoundedTradeDown,
                      color: AppColors.red,
                      subtitle: 'Dalam 1 Tahun',
                    ),
                    const SizedBox(height: AppSizes.paddingMedium),
                    Obx(
                      () => SizedBox(
                        height: 200,
                        child: IncomeChart(
                          color: AppColors.red,
                          incomeData: homeController.monthlyOutcome.value,
                        ),
                      ),
                    )
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
                child: Column(
                  children: [
                    const TitleIcon(
                      title: 'Tabungan',
                      icon: HugeIcons.strokeRoundedTradeUp,
                      color: AppColors.sky,
                      subtitle: 'Dalam 1 Tahun',
                    ),
                    const SizedBox(height: AppSizes.paddingLarge),
                    Obx(
                      () => SizedBox(
                          height: 150,
                          child: SavingChart(
                            data: homeController.monthlySaving.value,
                          )),
                    )
                  ],
                )),
          ),
        ),
      ],
    );
  }
}

