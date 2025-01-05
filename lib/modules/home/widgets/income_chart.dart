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
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 500000, // Interval 500 ribu
              getTitlesWidget: (value, meta) {
                if (value % 500000 == 0) {
                  double valueInt = value / 1000;

                  if (valueInt >= 1000) {
                    return Text(
                      '${(valueInt / 1000)}jt',
                      style: const TextStyle(
                        fontSize: 10,
                        color: AppColors.textLight,
                      ),
                      maxLines: 1,
                    );
                  } else {
                    return Text(
                      '${(value / 1000).toStringAsFixed(0)}k',
                      style: const TextStyle(
                        fontSize: 10,
                        color: AppColors.textLight,
                      ),
                      maxLines: 1,
                    );
                  }
                }
                return const SizedBox.shrink();
              },
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
                if (value.toInt() < months.length) {
                  return Text(
                    months[value.toInt()],
                    style: AppTextStyles.caption.copyWith(fontSize: 10),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
        gridData: FlGridData(
          show: true,
          horizontalInterval: 500000,
          verticalInterval: 2,
          getDrawingHorizontalLine: (value) => const FlLine(
            color: AppColors.textLight,
            strokeWidth: 0.5,
            dashArray: [3],
          ),
          drawVerticalLine: true,
          drawHorizontalLine: true,
          getDrawingVerticalLine: (value) => const FlLine(
            color: AppColors.textLight,
            strokeWidth: 0.5,
            dashArray: [3],
          ),
        ),
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
        minY: 0, // Nilai minimum sumbu Y
        maxY: (incomeData.reduce((a, b) => a > b ? a : b) / 500000).ceil() *
            500000, // Nilai maksimum sumbu Y
      ),
    );
  }
}
