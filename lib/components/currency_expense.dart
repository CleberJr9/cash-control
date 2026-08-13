import 'package:cash_control/assets/icons/fonts/font_app.dart';
import 'package:cash_control/core/theme/app_colors.dart';
import 'package:cash_control/core/theme/utils/format_currency.dart';
import 'package:flutter/material.dart';

class CurrencyExpense extends StatefulWidget {
  final double amount;
  const CurrencyExpense({super.key, required this.amount});

  @override
  State<CurrencyExpense> createState() => _CurrencyExpenseState();
}

class _CurrencyExpenseState extends State<CurrencyExpense> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formatCurrency(widget.amount),
              textAlign: TextAlign.center,
              style: AppTextStyles.heading.copyWith(
                fontSize: 32,
                fontWeight: FontWeight.w800,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
