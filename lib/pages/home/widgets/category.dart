import 'package:cash_control/assets/icons/fonts/font_app.dart';
import 'package:cash_control/components/category_icon.dart';
import 'package:cash_control/core/theme/app_colors.dart';
import 'package:cash_control/core/theme/enums/transaction_category.dart';
import 'package:cash_control/core/theme/utils/format_currency.dart';
import 'package:flutter/material.dart';

class CategoryAmount extends StatefulWidget {
  final double amount;
  final double totalAmount;
  final TransactionCategory category;
  const CategoryAmount({
    super.key,

    required this.amount,
    required this.totalAmount,
    required this.category,
  });
  @override
  State<CategoryAmount> createState() => ExpenseRowState();
}

class ExpenseRowState extends State<CategoryAmount> {
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
            CategoryIcon(category: widget.category, size: 38),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.category.label,
                    style: AppTextStyles.title.copyWith(
                      fontSize: 14,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: LinearProgressIndicator(
                      value: widget.amount / widget.totalAmount,
                      backgroundColor: AppColors.segment.withValues(alpha: 0.5),
                      minHeight: 8,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        widget.category.color,
                      ),
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
                  '- ${formatCurrency(widget.amount)}',
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
