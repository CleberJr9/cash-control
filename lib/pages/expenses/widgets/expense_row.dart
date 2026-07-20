import 'package:cash_control/assets/icons/fonts/font_app.dart';
import 'package:cash_control/components/category_icon.dart';
import 'package:cash_control/core/theme/app_colors.dart';
import 'package:cash_control/core/theme/utils/format_currency.dart';
import 'package:cash_control/models/expense/expense.models.dart';
import 'package:flutter/material.dart';

class ExpenserRow extends StatefulWidget {
  final ExpenseModels expense;
  const ExpenserRow({super.key, required this.expense});
  @override
  State<ExpenserRow> createState() => ExpenseRowState();
}

class ExpenseRowState extends State<ExpenserRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(
          color: AppColors.border,
          width: 1,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      height: 58,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          spacing: 12,
          children: [
            CategoryIcon(category: widget.expense.category, size: 38),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.expense.title,
                    style: AppTextStyles.title.copyWith(
                      fontSize: 14,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    widget.expense.category.label,
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '- ${formatCurrency(widget.expense.amount)}',
                  style: AppTextStyles.titleMax.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
