import 'package:cash_control/core/theme/enums/transaction_category.dart';

class CategoryModels {
  final double amount;
  final double totalAmount;
  final TransactionCategory category;
  const CategoryModels({
    required this.amount,
    required this.totalAmount,
    required this.category,
  });
}
