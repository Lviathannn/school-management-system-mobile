import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';

class SavingChart extends StatelessWidget {
  const SavingChart({super.key});

  @override
  Widget build(BuildContext context) {
    final List<double> savingData = [
      5.0,
      6.5,
      7.0,
      7.8,
      8.0,
      9.2,
      9.5,
      9.8,
      10.0,
      9.5,
      9.0,
      8.5
    ];
    final List<String> months = [
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

    return LineChart(
      LineChartData(
        gridData: FlGridData(
            show: true,
            horizontalInterval: 4,
            verticalInterval: 2,
            getDrawingHorizontalLine: (value) => const FlLine(
                  color: AppColors.textLight,
                  strokeWidth: 0.5,
                  dashArray: [3],
                ),
            drawVerticalLine: true,
            getDrawingVerticalLine: (value) => const FlLine(
                  color: AppColors.textLight,
                  strokeWidth: 0.5,
                  dashArray: [3],
                )),
        borderData: FlBorderData(
          show: false,
        ),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                if (value.toInt() < months.length) {
                  return Text(
                    months[value.toInt()],
                    style: const TextStyle(
                        fontSize: 10, color: AppColors.textLight),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          topTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            gradient: const LinearGradient(
              colors: [AppColors.sky, AppColors.primary],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            barWidth: 3,
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  AppColors.sky.withOpacity(0.1),
                  AppColors.primary.withOpacity(0.3),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            spots: savingData
                .asMap()
                .entries
                .map((entry) => FlSpot(entry.key.toDouble(), entry.value))
                .toList(),
            dotData: const FlDotData(
              show: false,
            ),
          ),
        ],
        minX: 0,
        maxX: savingData.length - 1,
        minY: 0,
        maxY: 10,
      ),
    );
  }
}
