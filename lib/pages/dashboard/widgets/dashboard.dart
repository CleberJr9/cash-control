import 'dart:math';
import 'package:cash_control/assets/icons/fonts/font_app.dart';
import 'package:cash_control/core/theme/utils/format_currency.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:cash_control/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  final List<int> values;
  final int totalValue;
  const Dashboard({super.key, required this.values, required this.totalValue});
  @override
  State<Dashboard> createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(
          color: AppColors.textMuted.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        spacing: 12,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total no período ',
                style: AppTextStyles.textRotuleDashboad.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              Text(
                formatCurrency(widget.totalValue),
                style: AppTextStyles.titleMax.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 102,
            child: BarChart(
              BarChartData(
                maxY: widget.values.reduce((a, b) => a > b ? a : b).toDouble(),
                barGroups: widget.values.asMap().entries.map((entry) {
                  final index = entry.key;
                  final value = entry.value.toDouble();
                  final isLast = index == widget.values.length - 1;

                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: value,
                        color: isLast
                            ? AppColors.primary
                            : AppColors.primary.withOpacity(0.3),
                        width: 24,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ],
                  );
                }).toList(),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const labels = ['S1', 'S2', 'S3', 'S4', 'S5', 'S6'];
                        final index = value.toInt();
                        if (index < 0 || index >= labels.length)
                          return const SizedBox();
                        return Text(
                          labels[index],
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.textMuted,
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false, reservedSize: 0),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false, reservedSize: 0),
                  ),
                ),
                gridData: FlGridData(show: false),
                borderData: FlBorderData(show: false),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
