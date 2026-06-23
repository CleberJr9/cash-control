import 'package:cash_control/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

enum FilterPeriod { month, week, day }

class FilterDashboard extends StatefulWidget {
  final ValueChanged<FilterPeriod>? onChange;
  const FilterDashboard({super.key, this.onChange});
  @override
  State<FilterDashboard> createState() => FilterDashboardState();
}

class FilterDashboardState extends State<FilterDashboard> {
  FilterPeriod _selected = FilterPeriod.week;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        spacing: 8,
        children: FilterPeriod.values.map((period) {
          final isSelected = _selected == period;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() => _selected = period);
                widget.onChange?.call(period);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.surface : AppColors.segment,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  getLabel(period),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: isSelected
                        ? AppColors.textPrimary
                        : AppColors.textSecondary,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

String getLabel(FilterPeriod period) {
  switch (period) {
    case FilterPeriod.month:
      return "Mês";
    case FilterPeriod.week:
      return "Semana";
    case FilterPeriod.day:
      return "Dia";
  }
}
