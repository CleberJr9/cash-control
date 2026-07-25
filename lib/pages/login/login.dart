import 'package:cash_control/assets/icons/fonts/font_app.dart';
import 'package:cash_control/core/theme/app_colors.dart';
import 'package:cash_control/pages/login/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:cash_control/components/icon_cash_control.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [LoginForm()],
            ),
          ),
        ),
      ),
    );
  }
}
