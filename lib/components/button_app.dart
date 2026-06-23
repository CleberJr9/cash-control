import 'package:cash_control/assets/icons/fonts/font_app.dart';
import 'package:cash_control/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

enum AppButtonVariant { primary, secondary, danger, ghost }

enum AppButtonSize { small, medium, large }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final bool isLoading;
  final bool fullWidth;

  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fullWidth ? double.infinity : null,
      height: 52,
      child: ElevatedButton(
        style: ButtonStyle(
          side: WidgetStateProperty.all(BorderSide.none),
          backgroundColor: WidgetStateProperty.all(AppColors.primary),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                label,
                style: TextStyle(
                  color: AppColors.textbutton,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
      ),
    );
  }
}
