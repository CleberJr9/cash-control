import 'package:cash_control/assets/icons/icons_app.dart';
import 'package:cash_control/components/app_switch.dart';
import 'package:cash_control/components/button_app.dart';
import 'package:cash_control/components/icon_svg.dart';
import 'package:cash_control/core/theme/app_colors.dart';
import 'package:cash_control/core/theme/enums/transaction_category.dart';
import 'package:cash_control/models/expense/expense.models.dart';
import 'package:cash_control/models/expense/expense_period.models.dart';
import 'package:cash_control/pages/dashboard/widgets/card_balance.dart';
import 'package:cash_control/pages/dashboard/widgets/dashboard.dart';
import 'package:cash_control/pages/dashboard/widgets/filter_date.dart';
import 'package:cash_control/pages/expenses/expense_period_section.dart';
import 'package:cash_control/shared/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'Inter'),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<ExpenseModels> expenses = [
    ExpenseModels(
      expenseId: '1',
      title: 'Almoço',
      category: TransactionCategory.FOOD,
      date: DateTime.now(),
      amount: 35.90,
      description: 'Almoço no restaurante',
    ),
    ExpenseModels(
      expenseId: '2',
      title: 'Uber',
      category: TransactionCategory.TRANSPORT,
      date: DateTime.now(),
      amount: 18.50,
      description: 'Corrida para o trabalho',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 24,
            children: [
              CardBalance(budget: 750000, moneySpent: 241830),
              FilterDashboard(),
              Dashboard(
                values: [120000, 180000, 150000, 210000, 170000, 241830],
                totalValue: 241830,
              ),
              AppSwitch(),
              ExpenseSection(
                expensePeriods: ExpensePeriodModels(
                  date: DateTime.now(),
                  sumAmount: 54.40,
                  expenses: expenses,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: AppColors.primary,
        child: const CustomSvgIcon(
          color: AppColors.segment,
          size: 20,
          svgString: SvgIcons.plusIcon,
        ),
      ),
      bottomNavigationBar: NavbarCashControl(page: "Inicío"),
    );
  }
}
