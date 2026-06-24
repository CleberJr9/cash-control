import 'package:cash_control/components/category_icon.dart';
import 'package:flutter/material.dart';

class ExpenserRow extends StatefulWidget {
  final String category;
  final String title;
  final int amount;
  const ExpenserRow({
    super.key,
    required this.category,
    required this.title,
    required this.amount,
  });
  @override
  State<ExpenserRow> createState() => ExpenseRowState();
}

class ExpenseRowState extends State<ExpenserRow> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(children: [CategoryIcon(category: .alimentacao, size: 38)]),
    );
  }
}
