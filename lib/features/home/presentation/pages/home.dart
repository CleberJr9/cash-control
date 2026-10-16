import 'package:cash_control/assets/icons/fonts/font_app.dart';
import 'package:cash_control/components/custom_navbar.dart';
import 'package:cash_control/components/floating_button.dart';
import 'package:cash_control/components/new_expense.dart';
import 'package:cash_control/core/theme/app_colors.dart';
import 'package:cash_control/core/theme/enums/page_enum.dart';
import 'package:cash_control/features/expenses/presentation/pages/expense.dart';
import 'package:cash_control/features/expenses/presentation/widgets/expense_row.dart';
import 'package:cash_control/features/home/application/home.provider.dart';
import 'package:cash_control/features/home/presentation/widgets/app_bar_home.dart';
import 'package:cash_control/features/home/presentation/widgets/card_balance.dart';
import 'package:cash_control/features/home/presentation/widgets/category.dart';
import 'package:cash_control/features/home/presentation/widgets/dashboard.dart';
import 'package:cash_control/features/home/presentation/widgets/filter_date.dart';
import 'package:cash_control/features/home/presentation/widgets/home_skelleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({super.key});
  void _onNewExpense(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const NewExpenseSheet(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeProvider);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: homeState.when(
              data: (homeData) => Column(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppBarHome(
                    month: homeData.budget.currentMonth,
                    nameUser: homeData.user.name,
                  ),
                  CardBalance(
                    budget: homeData.budget.monthlyBudget,
                    moneySpent: homeData.budget.spentThisMonth,
                  ),
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
                          ...homeData.byCategory.map(
                            (c) => CategoryAmount(
                              amount: c.amount,
                              totalAmount: homeData.budget.spentThisMonth,
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
                          InkWell(
                            onTap: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Expense(),
                              ),
                            ),
                            child: Text(
                              "Ver todas",
                              style: AppTextStyles.bodyBold.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        spacing: 2,
                        children: [
                          ...homeData.transactions.map(
                            (e) => ExpenserRow(expense: e),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              error: (error, stackTrace) =>
                  const Center(child: Text('Erro ao carregar dados')),
              loading: () => const HomeSkelleton(),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingButton(
        onPressed: () => _onNewExpense(context),
      ),
      bottomNavigationBar: NavbarCashControl(page: PageEnum.home),
    );
  }
}
