import 'package:cash_control/core/theme/app_colors.dart';
import 'package:cash_control/pages/login/widgets/login_form.dart';
import 'package:cash_control/pages/login/widgets/register_form.dart';
import 'package:flutter/material.dart';

enum LoginEnum { login, register, resetPassword }

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  LoginEnum _loginType = LoginEnum.login;
  // No build do LoginState
  void _onRegister() {
    setState(() => _loginType = LoginEnum.register);
  }

  void _onResetPassword() {
    setState(() => _loginType = LoginEnum.resetPassword);
  }

  void _onLogin() {
    setState(() => _loginType = LoginEnum.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox.expand(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (_loginType == LoginEnum.login)
                  Expanded(
                    child: Center(
                      child: LoginForm(
                        onSubmit: (email, senha) {
                          print(email);
                          print(senha);
                        },
                        register: _onRegister,
                        resetPassword: _onResetPassword,
                      ),
                    ),
                  )
                else if (_loginType == LoginEnum.register)
                  Expanded(
                    child: RegisterForm(login: _onLogin, register: _onLogin),
                  )
                else
                  Text("tela de recuperar senha"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
