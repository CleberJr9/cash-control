import 'package:cash_control/core/theme/enums/transaction_category.dart';

class Expense {
  final String expenseId;
  final TransactionCategory category;
  final DateTime date;
  final double amount;
  final String description;
  final DateTime? createdAt;

  const Expense({
    required this.expenseId,
    required this.category,
    required this.date,
    required this.amount,
    required this.description,
    this.createdAt,
  });
}
