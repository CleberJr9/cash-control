import 'package:cash_control/core/theme/enums/transaction_category.dart';

class ExpenseModels {
  final String id;
  final String title;
  final TransactionCategory category;
  final DateTime date;
  final double amount;
  final String? description;
  final DateTime? createdAt;

  const ExpenseModels({
    required this.id,
    required this.title,
    required this.category,
    required this.date,
    required this.amount,
    this.description,
    this.createdAt,
  });
  factory ExpenseModels.fromJson(Map<String, dynamic> json) {
    return ExpenseModels(
      id: json['id'] as String,
      title: json['title'] as String,
      category: TransactionCategory.fromKey(json['category'] as String),
      date: DateTime.parse(json['date'] as String),
      amount: (json['amount'] as num).toDouble(),
      description: json['description'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
    );
  }
}
