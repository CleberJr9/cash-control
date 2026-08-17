import 'package:cash_control/assets/icons/fonts/font_app.dart';
import 'package:cash_control/components/back_page_icon.dart';
import 'package:cash_control/components/button_app.dart';
import 'package:cash_control/components/textfield.dart';
import 'package:cash_control/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  final VoidCallback login;
  final VoidCallback register;
  const RegisterForm({super.key, required this.login, required this.register});

  @override
  State<RegisterForm> createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmarSenhaController = TextEditingController();
  bool _check = true;

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 32,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              spacing: 24,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(onTap: widget.login, child: BackPageIcon()),
                  ],
                ),

                Column(
                  // form login
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 8,
                  children: [
                    TextFieldCashControl(
                      controller: _nameController,
                      label: "Nome",
                      hintText: "Informe seu nome",
                      keyboardType: TextInputType.emailAddress,
                    ),
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
                    TextFieldCashControl(
                      label: "Confirme sua senha",
                      controller: _confirmarSenhaController,
                      hintText: "Confirmar sua senha",
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    Row(
                      spacing: 2,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: _check,
                          activeColor: AppColors.primary,
                          checkColor: AppColors.background,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                          side: BorderSide(
                            color: AppColors.textMuted,
                            width: 1,
                          ),
                          onChanged: (_) {
                            setState(() {
                              _check = !_check;
                            });
                          },
                        ),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              text: 'Concordo com os ',
                              style: AppTextStyles.labelTextField.copyWith(
                                fontWeight: FontWeight(400),
                                color: AppColors.textSecondary,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Termos de uso',
                                  style: AppTextStyles.labelTextField.copyWith(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight(700),
                                  ),
                                ),
                                TextSpan(
                                  text: ' e a ',
                                  style: AppTextStyles.labelTextField.copyWith(
                                    fontWeight: FontWeight(400),
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Política de Privacidade',
                                  style: AppTextStyles.labelTextField.copyWith(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight(700),
                                  ),
                                ),
                              ],
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
        ),

        Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppButton(
              label: 'Criar conta',
              fullWidth: true,
              backgroundColor: AppColors.primary,
              labelColor: AppColors.textbutton,
              borderColor: AppColors.primary,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Já tem conta? ",
                  style: AppTextStyles.labelTextField.copyWith(
                    fontWeight: FontWeight(400),
                    color: AppColors.textSecondary,
                  ),
                ),
                InkWell(
                  onTap: widget.login,
                  child: Text(
                    "Entrar",
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
