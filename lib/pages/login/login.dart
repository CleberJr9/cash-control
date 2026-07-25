import 'package:cash_control/assets/icons/fonts/font_app.dart';
import 'package:cash_control/components/textfield.dart';
import 'package:cash_control/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:cash_control/components/icon_cash_control.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 24,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                spacing: 12,
                children: [
                  IconCashControl(
                    size: 72,
                    color: AppColors.primary,
                    iconColor: AppColors.background,
                  ),
                  Text(
                    "Cash Control",
                    style: AppTextStyles.titleMax.copyWith(
                      fontSize: 28,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            TextFieldCashControl(
              label: 'email',
              controller: TextEditingController(),
            ),
          ],
        ),
      ),
    );
  }
}
