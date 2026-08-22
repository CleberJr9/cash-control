import 'package:cash_control/assets/icons/fonts/font_app.dart';
import 'package:cash_control/components/back_page_icon.dart';
import 'package:cash_control/components/button_app.dart';
import 'package:cash_control/components/textfield.dart';
import 'package:cash_control/core/theme/app_colors.dart';
import 'package:cash_control/pages/home/home.dart';
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
  final _formKey = GlobalKey<FormState>();
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$');
  bool _check = true;

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    _nameController.dispose();
    _confirmarSenhaController.dispose();
    super.dispose();
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Informe sua senha';
    }
    if (value.length < 8) {
      return 'A senha deve ter pelo menos 8 caracteres';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'A senha deve conter uma letra maiúscula';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'A senha deve conter uma letra minúscula';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'A senha deve conter um número';
    }
    if (!RegExp(r'[!@#$%^&*()_+]').hasMatch(value)) {
      return 'A senha deve conter um caractere especiais';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirme sua senha';
    }
    if (value != _senhaController.text) {
      return 'As senhas não coincidem';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Informe seu email';
    }
    if (!emailRegex.hasMatch(value)) {
      return 'Insira um email válido';
    }
    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Informe seu nome';
    }
    if (value.length < 3) {
      return 'O nome deve ter pelo menos 3 caracteres';
    }
    return null;
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

                Form(
                  key: _formKey,
                  child: Column(
                    // form login
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 8,
                    children: [
                      TextFieldCashControl(
                        controller: _nameController,
                        label: "Nome",
                        hintText: "Informe seu nome",
                        keyboardType: TextInputType.emailAddress,
                        validator: validateName,
                      ),
                      TextFieldCashControl(
                        controller: _emailController,
                        label: "Email",
                        hintText: "Informe seu Email",
                        keyboardType: TextInputType.emailAddress,
                        validator: validateEmail,
                      ),
                      TextFieldCashControl(
                        label: "Senha",
                        controller: _senhaController,
                        hintText: "Informe sua senha",
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        validator: validatePassword,
                      ),
                      TextFieldCashControl(
                        label: "Confirme sua senha",
                        controller: _confirmarSenhaController,
                        hintText: "Confirmar sua senha",
                        keyboardType: TextInputType.visiblePassword,
                        validator: validateConfirmPassword,
                        obscureText: true,
                      ),
                      Column(
                        children: [
                          Text(
                            "Sua senha deve conter pelo menos 8 caracteres e uma letra maiúscula e minúscula, e um número.",
                            style: AppTextStyles.body.copyWith(
                              color: AppColors.primary.withValues(alpha: 0.8),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
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
                                    style: AppTextStyles.labelTextField
                                        .copyWith(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight(700),
                                        ),
                                  ),
                                  TextSpan(
                                    text: ' e a ',
                                    style: AppTextStyles.labelTextField
                                        .copyWith(
                                          fontWeight: FontWeight(400),
                                          color: AppColors.textSecondary,
                                        ),
                                  ),
                                  TextSpan(
                                    text: 'Política de Privacidade',
                                    style: AppTextStyles.labelTextField
                                        .copyWith(
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
              onPressed: () => {
                if (_formKey.currentState!.validate())
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  ),
              },
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
