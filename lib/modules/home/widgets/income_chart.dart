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
    double maxIncome = incomeData.reduce((a, b) => a > b ? a : b);
    double maxY;

    if (maxIncome > 0) {
      maxY = (maxIncome / 1000000).ceil() * 1000000;
    } else {
      maxY = 2000000;
    }

    double yInterval = maxY / 4;

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
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              reservedSize: 30,
              showTitles: true,
              interval: yInterval, // Set interval agar hanya ada 5 ticks
              getTitlesWidget: (value, meta) {
                if (value % yInterval == 0) {
                  double valueInt = value / 1000;
                  return Text(
                    valueInt >= 1000
                        ? '${(valueInt / 1000)}jt'
                        : '${valueInt.toStringAsFixed(0)}k',
                    style: const TextStyle(
                        fontSize: 10, color: AppColors.textLight),
                    maxLines: 1,
                  );
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
                  'Dec'
                ];
                return value.toInt() < months.length
                    ? Text(months[value.toInt()],
                        style: AppTextStyles.caption.copyWith(fontSize: 10))
                    : const SizedBox.shrink();
              },
            ),
          ),
        ),
        gridData: FlGridData(
          show: true,
          horizontalInterval: yInterval, // Atur interval agar hanya ada 5 garis
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
                'Desember'
              ];
              return BarTooltipItem(
                '${months[groupIndex]}: ${formatRupiah(rod.toY.toInt())}',
                AppTextStyles.caption.copyWith(
                    color: AppColors.white, fontWeight: FontWeight.w500),
              );
            },
          ),
        ),
        minY: 0,
        maxY: maxY, // Gunakan maxY yang sudah dihitung
      ),
    );
  }
}
