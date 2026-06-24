import 'package:cash_control/core/theme/enums/transaction_category.dart';
import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  final TransactionCategory category;
  final double size;

  const CategoryIcon({super.key, required this.category, this.size = 44});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: category.color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(size * 0.25),
      ),
      alignment: Alignment.center,
      child: Text(
        category.sigla,
        style: TextStyle(
          color: category.color,
          fontWeight: FontWeight.bold,
          fontSize: size * 0.36,
        ),
      ),
    );
  }
}
