import 'package:cash_control/assets/icons/fonts/font_app.dart';
import 'package:cash_control/core/theme/app_colors.dart';
import 'package:cash_control/core/theme/enums/page_enum.dart';
import 'package:cash_control/core/theme/enums/transaction_category.dart';
import 'package:cash_control/models/category/category.models.dart';
import 'package:cash_control/models/expense/expense.models.dart';
import 'package:cash_control/pages/expenses/widgets/expense_row.dart';
import 'package:cash_control/pages/home/widgets/card_balance.dart';
import 'package:cash_control/pages/home/widgets/category.dart';
import 'package:cash_control/pages/home/widgets/dashboard.dart';
import 'package:cash_control/pages/home/widgets/filter_date.dart';
import 'package:cash_control/shared/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static List<CategoryModels> get mocksCategory => const [
    CategoryModels(
      category: TransactionCategory.FOOD,
      amount: 424.30,
      totalAmount: 3000.00,
    ),
    CategoryModels(
      category: TransactionCategory.TRANSPORT,
      amount: 227.80,
      totalAmount: 3000.00,
    ),
    CategoryModels(
      category: TransactionCategory.HOUSING,
      amount: 1728.00,
      totalAmount: 3000.00,
    ),
    CategoryModels(
      category: TransactionCategory.LEISURE,
      amount: 160.80,
      totalAmount: 3000.00,
    ),
    CategoryModels(
      category: TransactionCategory.SHOPPING,
      amount: 1189.50,
      totalAmount: 3000.00,
    ),
    CategoryModels(
      category: TransactionCategory.HEALTH,
      amount: 722.40,
      totalAmount: 3000.00,
    ),
  ];
  static List<ExpenseModels> get mocksExpenses => [
    ExpenseModels(
      expenseId: '1',
      title: 'Almoço',
      category: TransactionCategory.FOOD,
      date: DateTime(2026, 7, 20),
      amount: 42.50,
      description: 'Restaurante',
    ),
    ExpenseModels(
      expenseId: '2',
      title: 'Café',
      category: TransactionCategory.FOOD,
      date: DateTime(2026, 7, 20),
      amount: 12.00,
      description: 'Padaria',
    ),
    ExpenseModels(
      expenseId: '3',
      title: 'Mercado',
      category: TransactionCategory.FOOD,
      date: DateTime(2026, 7, 19),
      amount: 289.90,
      description: 'Compras do mês',
    ),
    ExpenseModels(
      expenseId: '4',
      title: 'Pizza',
      category: TransactionCategory.FOOD,
      date: DateTime(2026, 7, 18),
      amount: 79.90,
      description: 'Jantar',
    ),

    ExpenseModels(
      expenseId: '5',
      title: 'Uber',
      category: TransactionCategory.TRANSPORT,
      date: DateTime(2026, 7, 20),
      amount: 24.30,
      description: 'Trabalho',
    ),
    ExpenseModels(
      expenseId: '6',
      title: 'Combustível',
      category: TransactionCategory.TRANSPORT,
      date: DateTime(2026, 7, 19),
      amount: 180.00,
      description: 'Gasolina',
    ),
    ExpenseModels(
      expenseId: '7',
      title: 'Estacionamento',
      category: TransactionCategory.TRANSPORT,
      date: DateTime(2026, 7, 18),
      amount: 18.00,
      description: 'Shopping',
    ),
    ExpenseModels(
      expenseId: '8',
      title: 'Ônibus',
      category: TransactionCategory.TRANSPORT,
      date: DateTime(2026, 7, 17),
      amount: 5.50,
      description: 'Passagem',
    ),

    ExpenseModels(
      expenseId: '9',
      title: 'Aluguel',
      category: TransactionCategory.HOUSING,
      date: DateTime(2026, 7, 15),
      amount: 1200.00,
      description: 'Mensalidade',
    ),
    ExpenseModels(
      expenseId: '10',
      title: 'Energia',
      category: TransactionCategory.HOUSING,
      date: DateTime(2026, 7, 14),
      amount: 210.70,
      description: 'Conta de luz',
    ),
    ExpenseModels(
      expenseId: '11',
      title: 'Água',
      category: TransactionCategory.HOUSING,
      date: DateTime(2026, 7, 14),
      amount: 92.40,
      description: 'Saneamento',
    ),
    ExpenseModels(
      expenseId: '12',
      title: 'Internet',
      category: TransactionCategory.HOUSING,
      date: DateTime(2026, 7, 13),
      amount: 119.90,
      description: 'Fibra óptica',
    ),
    ExpenseModels(
      expenseId: '13',
      title: 'Gás',
      category: TransactionCategory.HOUSING,
      date: DateTime(2026, 7, 13),
      amount: 105.00,
      description: 'Botijão',
    ),

    ExpenseModels(
      expenseId: '14',
      title: 'Cinema',
      category: TransactionCategory.LEISURE,
      date: DateTime(2026, 7, 18),
      amount: 48.00,
      description: 'Ingresso',
    ),
    ExpenseModels(
      expenseId: '15',
      title: 'Netflix',
      category: TransactionCategory.LEISURE,
      date: DateTime(2026, 7, 12),
      amount: 55.90,
      description: 'Assinatura',
    ),
    ExpenseModels(
      expenseId: '16',
      title: 'Spotify',
      category: TransactionCategory.LEISURE,
      date: DateTime(2026, 7, 11),
      amount: 21.90,
      description: 'Premium',
    ),
    ExpenseModels(
      expenseId: '17',
      title: 'Parque',
      category: TransactionCategory.LEISURE,
      date: DateTime(2026, 7, 10),
      amount: 35.00,
      description: 'Passeio',
    ),

    ExpenseModels(
      expenseId: '18',
      title: 'Tênis',
      category: TransactionCategory.SHOPPING,
      date: DateTime(2026, 7, 16),
      amount: 399.90,
      description: 'Esportivo',
    ),
    ExpenseModels(
      expenseId: '19',
      title: 'Mouse',
      category: TransactionCategory.SHOPPING,
      date: DateTime(2026, 7, 15),
      amount: 149.90,
      description: 'Sem fio',
    ),
    ExpenseModels(
      expenseId: '20',
      title: 'Teclado',
      category: TransactionCategory.SHOPPING,
      date: DateTime(2026, 7, 15),
      amount: 229.90,
      description: 'Mecânico',
    ),
    ExpenseModels(
      expenseId: '21',
      title: 'Fone Bluetooth',
      category: TransactionCategory.SHOPPING,
      date: DateTime(2026, 7, 14),
      amount: 329.90,
      description: 'Headphone',
    ),
    ExpenseModels(
      expenseId: '22',
      title: 'Camiseta',
      category: TransactionCategory.SHOPPING,
      date: DateTime(2026, 7, 13),
      amount: 79.90,
      description: 'Roupa',
    ),

    ExpenseModels(
      expenseId: '23',
      title: 'Farmácia',
      category: TransactionCategory.HEALTH,
      date: DateTime(2026, 7, 20),
      amount: 68.40,
      description: 'Medicamentos',
    ),
    ExpenseModels(
      expenseId: '24',
      title: 'Consulta',
      category: TransactionCategory.HEALTH,
      date: DateTime(2026, 7, 18),
      amount: 180.00,
      description: 'Clínica',
    ),
    ExpenseModels(
      expenseId: '25',
      title: 'Academia',
      category: TransactionCategory.HEALTH,
      date: DateTime(2026, 7, 17),
      amount: 99.90,
      description: 'Mensalidade',
    ),
    ExpenseModels(
      expenseId: '26',
      title: 'Vitaminas',
      category: TransactionCategory.HEALTH,
      date: DateTime(2026, 7, 16),
      amount: 54.80,
      description: 'Suplementos',
    ),
    ExpenseModels(
      expenseId: '27',
      title: 'Exames',
      category: TransactionCategory.HEALTH,
      date: DateTime(2026, 7, 15),
      amount: 320.00,
      description: 'Laboratório',
    ),
  ];
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
                        ...mocksCategory.map(
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
                        ...mocksExpenses.map((e) => ExpenserRow(expense: e)),
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
