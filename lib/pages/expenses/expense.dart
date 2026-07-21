import 'package:cash_control/assets/icons/fonts/font_app.dart';
import 'package:cash_control/core/theme/app_colors.dart';
import 'package:cash_control/core/theme/enums/transaction_category.dart';
import 'package:cash_control/models/expense/expense.models.dart';
import 'package:cash_control/models/expense/expense_period.models.dart';
import 'package:cash_control/pages/dashboard/widgets/filter_date.dart';
import 'package:cash_control/pages/expenses/widgets/expense_period_section.dart';
import 'package:cash_control/shared/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';

class Expense extends StatelessWidget {
  const Expense({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ExpensePeriodModels> expensePeriods = [
      ExpensePeriodModels(
        date: DateTime(2026, 7, 20),
        sumAmount: 154.40,
        expenses: [
          ExpenseModels(
            expenseId: '1',
            title: 'Almoço',
            category: TransactionCategory.FOOD,
            date: DateTime(2026, 7, 20),
            amount: 35.90,
            description: 'Almoço no restaurante',
          ),
          ExpenseModels(
            expenseId: '2',
            title: 'Uber',
            category: TransactionCategory.TRANSPORT,
            date: DateTime(2026, 7, 20),
            amount: 18.50,
            description: 'Corrida para o trabalho',
          ),
          ExpenseModels(
            expenseId: '3',
            title: 'Mercado',
            category: TransactionCategory.FOOD,
            date: DateTime(2026, 7, 20),
            amount: 100.00,
            description: 'Compras da semana',
          ),
        ],
      ),

      ExpensePeriodModels(
        date: DateTime(2026, 7, 19),
        sumAmount: 328.75,
        expenses: [
          ExpenseModels(
            expenseId: '4',
            title: 'Combustível',
            category: TransactionCategory.TRANSPORT,
            date: DateTime(2026, 7, 19),
            amount: 180.00,
            description: 'Abastecimento',
          ),
          ExpenseModels(
            expenseId: '5',
            title: 'Cinema',
            category: TransactionCategory.LEISURE,
            date: DateTime(2026, 7, 19),
            amount: 48.75,
            description: 'Ingresso',
          ),
          ExpenseModels(
            expenseId: '6',
            title: 'Jantar',
            category: TransactionCategory.FOOD,
            date: DateTime(2026, 7, 19),
            amount: 100.00,
            description: 'Jantar com amigos',
          ),
        ],
      ),

      ExpensePeriodModels(
        date: DateTime(2026, 7, 18),
        sumAmount: 560.00,
        expenses: [
          ExpenseModels(
            expenseId: '7',
            title: 'Internet',
            category: TransactionCategory.LEISURE,
            date: DateTime(2026, 7, 18),
            amount: 120.00,
            description: 'Mensalidade',
          ),
          ExpenseModels(
            expenseId: '8',
            title: 'Energia',
            category: TransactionCategory.HOUSING,
            date: DateTime(2026, 7, 18),
            amount: 240.00,
            description: 'Conta de luz',
          ),
          ExpenseModels(
            expenseId: '9',
            title: 'Água',
            category: TransactionCategory.LEISURE,
            date: DateTime(2026, 7, 18),
            amount: 80.00,
            description: 'Conta de água',
          ),
          ExpenseModels(
            expenseId: '10',
            title: 'Gás',
            category: TransactionCategory.HOUSING,
            date: DateTime(2026, 7, 18),
            amount: 120.00,
            description: 'Botijão de gás',
          ),
        ],
      ),

      ExpensePeriodModels(
        date: DateTime(2026, 7, 17),
        sumAmount: 1245.90,
        expenses: [
          ExpenseModels(
            expenseId: '11',
            title: 'Notebook',
            category: TransactionCategory.SHOPPING,
            date: DateTime(2026, 7, 17),
            amount: 999.90,
            description: 'Acessório de trabalho',
          ),
          ExpenseModels(
            expenseId: '12',
            title: 'Mouse',
            category: TransactionCategory.SHOPPING,
            date: DateTime(2026, 7, 17),
            amount: 120.00,
            description: 'Mouse sem fio',
          ),
          ExpenseModels(
            expenseId: '13',
            title: 'Teclado',
            category: TransactionCategory.SHOPPING,
            date: DateTime(2026, 7, 17),
            amount: 126.00,
            description: 'Teclado mecânico',
          ),
        ],
      ),

      ExpensePeriodModels(
        date: DateTime(2026, 7, 16),
        sumAmount: 215.30,
        expenses: [
          ExpenseModels(
            expenseId: '14',
            title: 'Farmácia',
            category: TransactionCategory.HEALTH,
            date: DateTime(2026, 7, 16),
            amount: 85.30,
            description: 'Medicamentos',
          ),
          ExpenseModels(
            expenseId: '15',
            title: 'Consulta',
            category: TransactionCategory.HEALTH,
            date: DateTime(2026, 7, 16),
            amount: 130.00,
            description: 'Clínica médica',
          ),
        ],
      ),

      ExpensePeriodModels(
        date: DateTime(2026, 7, 15),
        sumAmount: 412.80,
        expenses: [
          ExpenseModels(
            expenseId: '16',
            title: 'Academia',
            category: TransactionCategory.HEALTH,
            date: DateTime(2026, 7, 15),
            amount: 89.90,
            description: 'Mensalidade',
          ),
          ExpenseModels(
            expenseId: '17',
            title: 'Mercado',
            category: TransactionCategory.FOOD,
            date: DateTime(2026, 7, 15),
            amount: 322.90,
            description: 'Compras do mês',
          ),
        ],
      ),

      ExpensePeriodModels(
        date: DateTime(2026, 7, 14),
        sumAmount: 95.00,
        expenses: [
          ExpenseModels(
            expenseId: '18',
            title: 'Café',
            category: TransactionCategory.FOOD,
            date: DateTime(2026, 7, 14),
            amount: 15.00,
            description: 'Cafeteria',
          ),
          ExpenseModels(
            expenseId: '19',
            title: 'Estacionamento',
            category: TransactionCategory.TRANSPORT,
            date: DateTime(2026, 7, 14),
            amount: 30.00,
            description: 'Shopping',
          ),
          ExpenseModels(
            expenseId: '20',
            title: 'Lanche',
            category: TransactionCategory.FOOD,
            date: DateTime(2026, 7, 14),
            amount: 50.00,
            description: 'Hambúrguer',
          ),
        ],
      ),
    ];
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
              FilterDashboard(),
              ...expensePeriods.map(
                (exp) => ExpenseSection(expensePeriods: exp),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavbarCashControl(page: "Despesas"),
    );
  }
}
