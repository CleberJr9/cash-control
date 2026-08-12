import 'package:cash_control/components/currency_expense.dart';
import 'package:cash_control/components/numerickey_board.dart';
import 'package:cash_control/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class NewExpenseSheet extends StatefulWidget {
  const NewExpenseSheet({super.key});

  @override
  State<NewExpenseSheet> createState() => _NewExpenseSheetState();
}

class _NewExpenseSheetState extends State<NewExpenseSheet> {
  double _amount = 0;

  void _valueChanged(double value) {
    setState(() {
      _amount = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: double.infinity,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CurrencyExpense(amount: _amount),

              SizedBox(height: 32),

              NumericKeyboard(onChanged: (value) => _valueChanged(value)),
            ],
          ),
        ),
      ),
    );
  }
}
