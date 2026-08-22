import 'package:cash_control/assets/icons/fonts/font_app.dart';
import 'package:cash_control/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TextFieldCashControl extends StatefulWidget {
  final String label;
  final bool? islabelRequired;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  const TextFieldCashControl({
    super.key,
    required this.label,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    this.islabelRequired = true,
    this.obscureText = false,
    this.validator,
  });

  @override
  State<TextFieldCashControl> createState() => _TextFieldCashControlState();
}

class _TextFieldCashControlState extends State<TextFieldCashControl> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6,
      children: [
        if (widget.islabelRequired ?? true)
          Text(widget.label, style: AppTextStyles.labelTextField),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          cursorColor: AppColors.primary,
          keyboardType: widget.keyboardType,
          obscureText: _obscure,
          decoration: InputDecoration(
            suffixIcon: widget.obscureText
                ? IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: Icon(
                      _obscure ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.textMuted,
                    ),
                    onPressed: () {
                      setState(() => _obscure = !_obscure);
                    },
                  )
                : null,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.primary, width: 1),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            hintText: widget.hintText,
            hintStyle: AppTextStyles.hintText,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.border, width: 1),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.segment, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.error, width: 1),
            ),
          ),
        ),
      ],
    );
  }
}
