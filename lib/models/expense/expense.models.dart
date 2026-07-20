import 'package:cash_control/core/theme/enums/transaction_category.dart';

class ExpenseModels {
  final String expenseId;
  final String title;
  final TransactionCategory category;
  final DateTime date;
  final double amount;
  final String description;
  final DateTime? createdAt;

  const ExpenseModels({
    required this.expenseId,
    required this.title,
    required this.category,
    required this.date,
    required this.amount,
    required this.description,
    this.createdAt,
  });
}
