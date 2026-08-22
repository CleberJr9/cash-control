import 'dart:math';

import 'package:cash_control/assets/icons/fonts/font_app.dart';
import 'package:cash_control/components/category_icon.dart';
import 'package:cash_control/core/theme/app_colors.dart';
import 'package:cash_control/core/theme/enums/transaction_category.dart';
import 'package:cash_control/features/expenses/data/mocks/transactions_category.dart';
import 'package:flutter/material.dart';

class SelectedCategory extends StatefulWidget {
  final ValueChanged<TransactionCategory> onChange;
  const SelectedCategory({super.key, required this.onChange});

  @override
  State<SelectedCategory> createState() => _SelectedCategoryState();
}

class _SelectedCategoryState extends State<SelectedCategory> {
  TransactionCategory _selectedCategory = TransactionCategory.FOOD;

  void _onChange(TransactionCategory category) {
    setState(() => _selectedCategory = category);
    widget.onChange(category);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 12,
          children: [
            ...TransactionCategoryMock.categories.map(
              (c) => InkWell(
                onTap: () => _onChange(c),
                child: AnimatedContainer(
                  height: 48,
                  width: min(154, 200),
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: c == _selectedCategory
                        ? AppColors.primary.withValues(alpha: 0.05)
                        : AppColors.background,

                    borderRadius: BorderRadius.circular(34),
                    border: Border.all(
                      color: c == _selectedCategory
                          ? AppColors.primary
                          : AppColors.border,
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 8,
                    children: [
                      CategoryIcon(category: c, size: 32),
                      Text(
                        c.label,
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.textPrimary,
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
