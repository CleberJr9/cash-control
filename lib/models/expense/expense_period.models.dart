import 'package:cash_control/models/expense/expense.models.dart';

class ExpensePeriodModels {
  final DateTime date;
  final double sumAmount;
  final List<ExpenseModels> expenses;

  const ExpensePeriodModels({
    required this.date,
    required this.sumAmount,
    required this.expenses,
  });
}
