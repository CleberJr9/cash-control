import 'package:cash_control/assets/icons/fonts/font_app.dart';
import 'package:cash_control/components/back_page_icon.dart';
import 'package:cash_control/components/category_icon.dart';
import 'package:cash_control/core/theme/app_colors.dart';
import 'package:cash_control/core/theme/enums/transaction_category.dart';
import 'package:cash_control/core/theme/utils/format_currency.dart';
import 'package:cash_control/models/expense/expense.models.dart';
import 'package:cash_control/pages/expenses/widgets/expense_row.dart';
import 'package:flutter/material.dart';

class DetailCategory extends StatefulWidget {
  final TransactionCategory category;
  final double amount;
  const DetailCategory({
    super.key,
    required this.category,
    required this.amount,
  });

  @override
  State<DetailCategory> createState() => _DetailCategoryState();
}

class _DetailCategoryState extends State<DetailCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsGeometry.all(16),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 24,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      child: BackPageIcon(),
                      onTap: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 34),
                        child: Text(
                          "Categoria",
                          style: AppTextStyles.title.copyWith(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 8,
                  children: [
                    CategoryIcon(category: widget.category, size: 84),
                    Text(
                      widget.category.label,
                      style: AppTextStyles.titleMax.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      formatCurrency(widget.amount),
                      style: AppTextStyles.titleMax.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      '25% total do mês',
                      style: AppTextStyles.textField.copyWith(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: 8,
                  children: [
                    Expanded(
                      child: Container(
                        height: 84,
                        width: 200,
                        decoration: BoxDecoration(
                          color: AppColors.backgroundContainer,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColors.border,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Lançamentos",
                                style: AppTextStyles.heading.copyWith(
                                  color: AppColors.textSecondary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text("3", style: AppTextStyles.title),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 84,
                        width: 200,
                        decoration: BoxDecoration(
                          color: AppColors.backgroundContainer,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColors.border,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Média",
                                style: AppTextStyles.heading.copyWith(
                                  color: AppColors.textSecondary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                formatCurrency(widget.amount),
                                style: AppTextStyles.title,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Transações",
                          style: AppTextStyles.title.copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                    ExpenserRow(
                      expense: ExpenseModels(
                        title: "Despesa",
                        amount: 1000,
                        category: TransactionCategory.FOOD,
                        date: DateTime.now(),
                        description: "Descrição da despesa",
                        expenseId: "123",
                        createdAt: DateTime.now(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
