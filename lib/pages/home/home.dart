import 'package:cash_control/assets/icons/fonts/font_app.dart';
import 'package:cash_control/core/theme/app_colors.dart';
import 'package:cash_control/core/theme/enums/page_enum.dart';
import 'package:cash_control/mocks/category.mock.dart';
import 'package:cash_control/mocks/expenses.mock.dart';
import 'package:cash_control/pages/expenses/widgets/expense_row.dart';
import 'package:cash_control/pages/home/widgets/card_balance.dart';
import 'package:cash_control/pages/home/widgets/category.dart';
import 'package:cash_control/pages/home/widgets/dashboard.dart';
import 'package:cash_control/pages/home/widgets/filter_date.dart';
import 'package:cash_control/pages/home/widgets/app_bar_home.dart';
import 'package:cash_control/shared/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppBarHome(month: "Julho", nameUser: "Cleber Junior"),
                CardBalance(budget: 10000, moneySpent: 2000),
                FilterDashboard(),
                Dashboard(
                  totalValue: 15000,
                  values: [1000, 2000, 3000, 4000, 5000],
                ),
                Column(
                  spacing: 12,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Categorias",
                          style: AppTextStyles.bodyBold.copyWith(
                            fontWeight: FontWeight(700),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      spacing: 4,
                      children: [
                        ...CategoryMock.categories.map(
                          (c) => CategoryAmount(
                            amount: c.amount,
                            totalAmount: c.totalAmount,
                            category: c.category,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 12,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Últimas transações",
                          style: AppTextStyles.bodyBold.copyWith(
                            fontWeight: FontWeight(700),
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Ver todas",
                          style: AppTextStyles.bodyBold.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      spacing: 2,
                      children: [
                        ...EspenseMock.expenses.map(
                          (e) => ExpenserRow(expense: e),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavbarCashControl(page: PageEnum.home),
    );
  }
}
