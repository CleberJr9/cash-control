import 'package:cash_control/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const FloatingButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 54,
        height: 54,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.add, color: AppColors.background, size: 24)],
        ),
      ),
    );
  }
}
