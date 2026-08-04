import 'package:cash_control/core/theme/enums/transaction_category.dart';
import 'package:cash_control/models/category/category.models.dart';

class CategoryMock {
  static final List<CategoryModels> categories = [
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
}
