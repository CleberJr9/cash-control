import 'package:cash_control/assets/icons/fonts/font_app.dart';
import 'package:cash_control/components/button_app.dart';
import 'package:cash_control/components/currency_expense.dart';
import 'package:cash_control/components/numerickey_board.dart';
import 'package:cash_control/components/selected_category.dart';
import 'package:cash_control/components/textfield.dart';
import 'package:cash_control/core/theme/app_colors.dart';
import 'package:cash_control/core/theme/enums/transaction_category.dart';
import 'package:flutter/material.dart';

class NewExpenseSheet extends StatefulWidget {
  const NewExpenseSheet({super.key});

  @override
  State<NewExpenseSheet> createState() => _NewExpenseSheetState();
}

class _NewExpenseSheetState extends State<NewExpenseSheet> {
  double _amount = 0;
  TextEditingController _descritpionController = TextEditingController();
  TransactionCategory _selectedCategory = TransactionCategory.FOOD;
  void _onChange(TransactionCategory category) {
    setState(() => _selectedCategory = category);
  }

  void _valueChanged(double value) {
    setState(() {
      _amount = value;
    });
  }

  void _onCancel() {
    Navigator.of(context).pop();
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
        padding: EdgeInsets.only(top: 16),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 24,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => _onCancel(),
                    child: Text(
                      "Cancelar",
                      style: AppTextStyles.labelTextField.copyWith(
                        fontSize: 14,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 54),
                      child: Text(
                        "Nova despesa",
                        style: AppTextStyles.title.copyWith(
                          color: AppColors.textPrimary,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 84, child: CurrencyExpense(amount: _amount)),
              SelectedCategory(onChange: _onChange),
              TextFieldCashControl(
                label: "Descrição",
                controller: _descritpionController,
                hintText: "Descrição (opcional)",
                keyboardType: TextInputType.text,
                islabelRequired: false,
              ),

              NumericKeyboard(onChanged: (value) => _valueChanged(value)),
              AppButton(
                label: "Adicionar despesa",
                backgroundColor: AppColors.primary,
                borderColor: AppColors.primary,
                fullWidth: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
