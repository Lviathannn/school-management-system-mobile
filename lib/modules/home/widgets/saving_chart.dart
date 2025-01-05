import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:school_management_system/shared/themes/app_texts.dart';
import 'package:school_management_system/shared/utils/utils.dart';

class SavingChart extends StatelessWidget {
  const SavingChart({super.key});

  @override
  Widget build(BuildContext context) {
    final List<double> savingData = [
      5000000,
      6500000,
      7000000,
      7800000,
      8000000,
      9200000,
      9500000,
      9800000,
      10000000,
      9500000,
      9000000,
      8500000,
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
          horizontalInterval: 4000000,
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
          ),
        ),
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
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 2000000, // Interval label pada sumbu Y (2 juta)
              getTitlesWidget: (value, meta) {
                // Menampilkan nilai dalam format jutaan
                return Text(
                  '${(value / 1000000).toStringAsFixed(0)}jt',
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.textLight,
                  ),
                );
              },
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
        maxY: 10000000, // Maksimal nilai pada sumbu Y (10 juta)
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            getTooltipItems: (touchedSpots) => touchedSpots
                .map((touchedSpot) => LineTooltipItem(
                      '${months[touchedSpot.x.toInt()]}: ${formatRupiah(
                        touchedSpot.y.toInt(),
                      )}',
                      AppTextStyles.caption.copyWith(
                          color: AppColors.white, fontWeight: FontWeight.w500),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
