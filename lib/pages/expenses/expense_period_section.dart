import 'package:cash_control/core/theme/app_colors.dart';
import 'package:cash_control/core/theme/utils/format_currency.dart';
import 'package:cash_control/core/theme/utils/formate_date_label.dart';
import 'package:cash_control/models/expense/expense_period.models.dart';
import 'package:cash_control/pages/expenses/widgets/expense_row.dart';
import 'package:flutter/material.dart';

class ExpenseSection extends StatefulWidget {
  final ExpensePeriodModels expensePeriods;
  const ExpenseSection({super.key, required this.expensePeriods});

  @override
  State<ExpenseSection> createState() => ExpenseState();
}

class ExpenseState extends State<ExpenseSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 4,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                formatDateLabel(widget.expensePeriods.date),
                style: TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                formatCurrency(widget.expensePeriods.sumAmount),
                style: TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

        ...widget.expensePeriods.expenses.map(
          (expense) => ExpenserRow(expense: expense),
        ),
      ],
    );
  }
}
