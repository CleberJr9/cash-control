import 'package:cash_control/assets/icons/fonts/font_app.dart';
import 'package:cash_control/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TextFieldCashControl extends StatelessWidget {
  final String label;
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  const TextFieldCashControl({
    super.key,
    required this.label,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text(label, style: AppTextStyles.labelTextField),
        TextField(
          controller: controller,
          cursorColor: AppColors.primary,

          keyboardType: keyboardType,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.primary, width: 1),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            hintText: hintText,
            hintStyle: AppTextStyles.hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.segment, width: 1),
            ),
          ),
        ),
      ],
    );
  }
}
