import 'package:cash_control/assets/icons/fonts/font_app.dart';
import 'package:cash_control/assets/icons/icons_app.dart';
import 'package:cash_control/components/back_page_icon.dart';
import 'package:cash_control/components/button_app.dart';
import 'package:cash_control/components/icon_svg.dart';
import 'package:cash_control/components/textfield.dart';
import 'package:cash_control/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ResetPassForm extends StatefulWidget {
  final VoidCallback login;

  const ResetPassForm({super.key, required this.login});

  @override
  State<ResetPassForm> createState() => ResetPassFormState();
}

class ResetPassFormState extends State<ResetPassForm> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 36,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              spacing: 36,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  // row do back button bacj page
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(onTap: widget.login, child: BackPageIcon()),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12,
                  children: [
                    Container(
                      //icon
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceGreen,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomSvgIcon(
                            svgString: SvgIcons.lockIconSvg,
                            color: AppColors.primary,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: [
                        Text(
                          "Recuperar senha",
                          style: AppTextStyles.title.copyWith(
                            color: AppColors.textPrimary,
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          "Informe seu email para receber instruções para recuperar sua senha",
                          style: AppTextStyles.caption,
                        ),
                      ],
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
                  ],
                ),
              ],
            ),
          ),
        ),

        AppButton(label: 'Enviar email', fullWidth: true),
      ],
    );
  }
}
