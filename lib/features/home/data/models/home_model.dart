import 'package:cash_control/core/theme/enums/transaction_category.dart';
import 'package:cash_control/features/expenses/data/models/expense.models.dart';

class HomeModels {
  final UserModels user;
  final BudgetModels budget;
  final ChartPeriodModels chart;
  final List<ExpenseModels> transactions;
  final List<CategoryExpenseModels> byCategory;
  const HomeModels({
    required this.chart,
    required this.transactions,
    required this.user,
    required this.budget,
    required this.byCategory,
  });
  factory HomeModels.fromJson(Map<String, dynamic> json) {
    return HomeModels(
      chart: ChartPeriodModels.fromJson(json['chart'] as Map<String, dynamic>),
      transactions: (json['transactions'] as List<dynamic>)
          .map((e) => ExpenseModels.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: UserModels.fromJson(json['user'] as Map<String, dynamic>),
      budget: BudgetModels.fromJson(json['budget'] as Map<String, dynamic>),
      byCategory: (json['byCategory'] as List<dynamic>)
          .map((e) => CategoryExpenseModels.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class UserModels {
  final String name;
  const UserModels({required this.name});
  factory UserModels.fromJson(Map<String, dynamic> json) {
    return UserModels(name: json['name'] as String);
  }
}

class BudgetModels {
  final double monthlyBudget;
  final double spentThisMonth;
  final String currentMonth;
  const BudgetModels({
    required this.monthlyBudget,
    required this.spentThisMonth,
    required this.currentMonth,
  });
  factory BudgetModels.fromJson(Map<String, dynamic> json) {
    return BudgetModels(
      monthlyBudget: (json['monthlyBudget'] as num).toDouble(),
      spentThisMonth: (json['spentThisMonth'] as num).toDouble(),
      currentMonth: json['currentMonth'] as String,
    );
  }
}

class ChartPeriodModels {
  final List<DateExpenseModels> daily;
  final List<DateExpenseModels> weekly;
  final List<DateExpenseModels> monthly;
  const ChartPeriodModels({
    required this.daily,
    required this.weekly,
    required this.monthly,
  });
  factory ChartPeriodModels.fromJson(Map<String, dynamic> json) {
    return ChartPeriodModels(
      daily: (json['daily'] as List<dynamic>)
          .map((e) => DateExpenseModels.fromJson(e))
          .toList(),
      weekly: (json['weekly'] as List<dynamic>)
          .map((e) => DateExpenseModels.fromJson(e))
          .toList(),
      monthly: (json['monthly'] as List<dynamic>)
          .map((e) => DateExpenseModels.fromJson(e))
          .toList(),
    );
  }
}

class CategoryExpenseModels {
  final TransactionCategory category;
  final double amount;
  const CategoryExpenseModels({required this.category, required this.amount});
  factory CategoryExpenseModels.fromJson(Map<String, dynamic> json) {
    return CategoryExpenseModels(
      category: TransactionCategory.fromKey(json['category'] as String),
      amount: (json['amount'] as num).toDouble(),
    );
  }
}

class DateExpenseModels {
  final String date;
  final double amount;
  const DateExpenseModels({required this.date, required this.amount});
  factory DateExpenseModels.fromJson(Map<String, dynamic> json) {
    return DateExpenseModels(
      date: json['date'] as String,
      amount: (json['amount'] as num).toDouble(),
    );
  }
}

class HomeResponseModels {
  final HomeModels data;
  const HomeResponseModels({required this.data});
  factory HomeResponseModels.fromJson(Map<String, dynamic> json) {
    return HomeResponseModels(
      data: HomeModels.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}
