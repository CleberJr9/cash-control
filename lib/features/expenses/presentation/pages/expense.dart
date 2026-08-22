import 'package:cash_control/assets/icons/fonts/font_app.dart';
import 'package:cash_control/components/floating_button.dart';
import 'package:cash_control/components/new_expense.dart';
import 'package:cash_control/core/theme/app_colors.dart';
import 'package:cash_control/core/theme/enums/page_enum.dart';
import 'package:cash_control/features/expenses/data/mocks/expense.period.mock.dart';
import 'package:cash_control/features/expenses/presentation/widgets/expense_period_section.dart';
import 'package:cash_control/features/home/presentation/widgets/filter_date.dart';
import 'package:cash_control/shared/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';

class Expense extends StatelessWidget {
  const Expense({super.key});
  void _showNewExpense(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const NewExpenseSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 24,
            children: [
              Column(
                // header
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 12,
                children: [
                  Text(
                    'Despesas',
                    style: AppTextStyles.title.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    " 8 Lançamentos no valor X ",
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ),
              FilterDashboard(onChange: (period) {}),
              ...ExpensePeriodMock.expensePeriods.map(
                (exp) => ExpenseSection(expensePeriods: exp),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingButton(
        onPressed: () => _showNewExpense(context),
      ),
      bottomNavigationBar: NavbarCashControl(page: PageEnum.expenses),
    );
  }
}
