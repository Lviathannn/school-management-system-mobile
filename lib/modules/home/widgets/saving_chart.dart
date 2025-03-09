import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:school_management_system/shared/themes/app_colors.dart';
import 'package:school_management_system/shared/themes/app_texts.dart';
import 'package:school_management_system/shared/utils/utils.dart';

class SavingChart extends StatelessWidget {
  final List<double> data;
  const SavingChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    double maxIncome = data.reduce((a, b) => a > b ? a : b);
    double maxY;

    if (maxIncome > 0) {
      maxY = (maxIncome / 1000000).ceil() * 1000000;
    } else {
      maxY = 2000000;
    }

    double yInterval = maxY / 5;

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
          horizontalInterval: maxY,
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
                  return Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Text(
                      months[value.toInt()],
                      style: const TextStyle(
                          fontSize: 10, color: AppColors.textLight),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              reservedSize: 30,
              showTitles: true,
              interval: yInterval,
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
            spots: data
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
        maxX: data.length - 1,
        minY: 0,
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
