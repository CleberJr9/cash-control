import 'package:cash_control/assets/icons/fonts/font_app.dart';
import 'package:cash_control/components/back_page_icon.dart';
import 'package:cash_control/components/button_app.dart';
import 'package:cash_control/components/textfield.dart';
import 'package:cash_control/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileEdit extends StatefulWidget {
  final VoidCallback backPage;
  const ProfileEdit({super.key, required this.backPage});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 24,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(onTap: () => widget.backPage(), child: BackPageIcon()),
            Expanded(
              child: Text(
                "Editar perfil",
                style: AppTextStyles.heading.copyWith(
                  fontSize: 18,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(children: []),
                Container(
                  width: 88,
                  height: 88,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceGreen,
                    borderRadius: BorderRadius.circular(44),
                    border: Border.all(color: AppColors.border, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.segment,
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Alterar foto",
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          spacing: 16,
          children: [
            TextFieldCashControl(
              label: "Nome Completo",
              controller: _nameController,
              hintText: "Nome Completo",
              keyboardType: TextInputType.text,
            ),
            TextFieldCashControl(
              label: "Email",
              controller: _emailController,
              hintText: "Email",
              keyboardType: TextInputType.emailAddress,
            ),
            TextFieldCashControl(
              label: "Telefone",
              controller: _phoneController,
              hintText: "Telefone",
              keyboardType: TextInputType.phone,
            ),
          ],
        ),
        AppButton(
          label: "Salvar alterações",
          backgroundColor: AppColors.primary,
          borderColor: AppColors.primary,
          fullWidth: true,
        ),
      ],
    );
  }
}
