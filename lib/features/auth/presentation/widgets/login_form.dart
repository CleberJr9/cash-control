import 'package:cash_control/assets/icons/fonts/font_app.dart';
import 'package:cash_control/components/button_app.dart';
import 'package:cash_control/components/icon_cash_control.dart';
import 'package:cash_control/components/textfield.dart';
import 'package:cash_control/core/theme/app_colors.dart';
import 'package:cash_control/features/auth/application/auth_notifier.dart';
import 'package:cash_control/features/auth/application/auth_state.dart';
import 'package:cash_control/features/home/presentation/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginForm extends ConsumerStatefulWidget {
  final VoidCallback? resetPassword;
  final VoidCallback? register;
  const LoginForm({super.key, this.resetPassword, this.register});

  @override
  ConsumerState<LoginForm> createState() => LoginFormState();
}

class LoginFormState extends ConsumerState<LoginForm> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$');

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
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

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Informe sua senha';
    }
    return null;
  }

  void login() {
    if (_formKey.currentState!.validate()) {
      ref
          .read(authNotifierProvider.notifier)
          .login(_emailController.text, _senhaController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    final isLoading = authState is AuthStateLoading;
    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      switch (next) {
        case AuthStateSuccess():
          if (!mounted) return;

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );

        case AuthStateError():
          if (!mounted) return;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                next.error,
                style: AppTextStyles.body.copyWith(
                  color: AppColors.primaryLight,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              backgroundColor: AppColors.textSecondary,
            ),
          );

        case AuthStateLoading():
        case AuthStateInitial():
          break;
      }
    });

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
              Form(
                key: _formKey,
                child: Column(
                  // form login
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 8,
                  children: [
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
                      validator: validatePassword,
                      hintText: "Informe sua senha",
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
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
              borderColor: AppColors.primary,
              labelColor: AppColors.textbutton,
              isLoading: isLoading,
              onPressed: () {
                login();
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
                      color: const Color.fromARGB(255, 102, 131, 118),
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
