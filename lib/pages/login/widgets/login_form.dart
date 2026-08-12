import 'package:cash_control/assets/icons/fonts/font_app.dart';
import 'package:cash_control/components/button_app.dart';
import 'package:cash_control/components/icon_cash_control.dart';
import 'package:cash_control/components/textfield.dart';
import 'package:cash_control/core/theme/app_colors.dart';
import 'package:cash_control/pages/home/home.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final VoidCallback? resetPassword;
  final VoidCallback? register;
  const LoginForm({super.key, this.resetPassword, this.register});

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
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 32,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                  Text(
                    "Entre para controlar seus gastos",
                    style: AppTextStyles.caption,
                  ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: widget.resetPassword,
                        child: Text(
                          "Esqueceu sua senha?",
                          style: AppTextStyles.labelTextField.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight(700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),

        Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppButton(
              label: 'Entrar',
              backgroundColor: AppColors.primary,
              borderColor: AppColors.primaryLight,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              fullWidth: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Não tem conta? ",
                  style: AppTextStyles.labelTextField.copyWith(
                    fontWeight: FontWeight(400),
                    color: AppColors.textSecondary,
                  ),
                ),
                InkWell(
                  onTap: widget.register,
                  child: Text(
                    "Criar agora",
                    style: AppTextStyles.labelTextField.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight(700),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
