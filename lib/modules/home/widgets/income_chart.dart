import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:school_management_system/shared/themes/app_texts.dart';
import 'package:school_management_system/shared/utils/utils.dart';

class IncomeChart extends StatelessWidget {
  final List<double> incomeData;
  final Color color;

  const IncomeChart({super.key, required this.incomeData, required this.color});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        barGroups: incomeData.asMap().entries.map((entry) {
          final month = entry.key;
          final income = entry.value;
          return BarChartGroupData(
            x: month,
            barRods: [
              BarChartRodData(
                toY: income,
                color: color,
                width: 8,
                borderRadius: BorderRadius.circular(8),
              ),
            ],
          );
        }).toList(),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final months = [
                  'Jan',
                  'Feb',
                  'Mar',
                  'Apr',
                  'May',
                  'Jun',
                  'Jul',
                  'Aug',
                  'Sep',
                  'Oct',
                  'Nov',
                  'Dec',
                ];
                return Text(
                  months[value.toInt()],
                  style: AppTextStyles.caption.copyWith(fontSize: 10),
                );
              },
            ),
          ),
        ),
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            getTooltipColor: (group) => AppColors.textBold.withOpacity(0.5),
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              final months = [
                'Januari',
                'Februari',
                'Maret',
                'April',
                'Mei',
                'Juni',
                'Juli',
                'Agustus',
                'September',
                'Oktober',
                'November',
                'Desember',
              ];

              return BarTooltipItem(
                '${months[groupIndex]}: ${formatRupiah(rod.toY.toInt())}',
                AppTextStyles.caption.copyWith(
                    color: AppColors.white, fontWeight: FontWeight.w500),
              );
            },
          ),
        ),
      ),
    );
  }
}
