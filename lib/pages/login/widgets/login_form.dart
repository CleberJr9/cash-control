import 'dart:ffi';

import 'package:cash_control/assets/icons/fonts/font_app.dart';
import 'package:cash_control/components/button_app.dart';
import 'package:cash_control/components/icon_cash_control.dart';
import 'package:cash_control/components/textfield.dart';
import 'package:cash_control/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 24,
        children: [
          Column(
            // header login
            spacing: 4,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconCashControl(
                size: 64,
                color: AppColors.primary,
                iconColor: AppColors.background,
              ),
              Text(
                "Cash Control",
                style: AppTextStyles.title.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text("Controle suas despesas", style: AppTextStyles.caption),
            ],
          ),
          Column(
            // form login
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 8,
            children: [
              TextFieldCashControl(
                controller: _emailController,
                label: "Email",
                hintText: "Informe seu Email",
                keyboardType: TextInputType.emailAddress,
              ),
              TextFieldCashControl(
                label: "Senha",
                controller: _senhaController,
                hintText: "Informe sua senha",
                keyboardType: TextInputType.visiblePassword,
              ),
            ],
          ),
          AppButton(
            label: 'Entrar',
            onPressed: () {
              print('ação do login');
            },
            fullWidth: true,
          ),
        ],
      ),
    );
  }
}
