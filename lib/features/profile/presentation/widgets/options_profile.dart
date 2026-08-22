import 'package:cash_control/assets/icons/fonts/font_app.dart';
import 'package:cash_control/components/button_app.dart';
import 'package:cash_control/core/theme/app_colors.dart';
import 'package:cash_control/core/theme/utils/first_index_name.dart';
import 'package:cash_control/core/theme/utils/format_currency.dart';
import 'package:flutter/material.dart';

class OptionsProfile extends StatelessWidget {
  final String nameUer;
  final VoidCallback editProfile;
  final double amount;
  const OptionsProfile({
    super.key,
    required this.nameUer,
    required this.amount,
    required this.editProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 24,
      children: [
        Text("Perfil", style: AppTextStyles.heading),
        InkWell(
          onTap: () => editProfile(),
          child: Container(
            width: double.infinity,

            decoration: BoxDecoration(
              color: AppColors.surface,
              border: Border.all(color: AppColors.border, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 54,
                    width: 54,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceGreen,
                      borderRadius: BorderRadius.circular(44),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          firstIndexName(nameUer),
                          style: AppTextStyles.title.copyWith(
                            color: AppColors.primary,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 2,
                      children: [
                        Text(
                          nameUer,
                          style: AppTextStyles.body.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "clebergoesjr@gmail.com",
                          style: AppTextStyles.body.copyWith(
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: AppColors.textSecondary,
                  ),
                ],
              ),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            Text(
              "CONTA",
              style: AppTextStyles.title.copyWith(
                color: AppColors.textSecondary,
                fontSize: 14,
                letterSpacing: 0.5,
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.surface,
                border: Border.all(color: AppColors.border, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: 12,
                      children: [
                        SizedBox(
                          height: 38,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            spacing: 16,
                            children: [
                              Expanded(
                                child: Text(
                                  "Orçamento mensal",
                                  style: AppTextStyles.body.copyWith(
                                    color: AppColors.textPrimary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Text(
                                formatCurrency(amount),
                                style: AppTextStyles.body.copyWith(
                                  color: AppColors.textSecondary,
                                  fontWeight: FontWeight(600),
                                  fontSize: 14,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: AppColors.textSecondary,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: AppColors.border,
                          thickness: 1,
                          height: 1,
                        ),
                        SizedBox(
                          height: 38,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            spacing: 16,
                            children: [
                              Expanded(
                                child: Text(
                                  "Notificações",
                                  style: AppTextStyles.body.copyWith(
                                    color: AppColors.textPrimary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),

                              Switch.adaptive(
                                value: true,
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: AppColors.border,
                          thickness: 1,
                          height: 1,
                        ),
                        SizedBox(
                          height: 38,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            spacing: 16,
                            children: [
                              Expanded(
                                child: Text(
                                  "Modo escuro",
                                  style: AppTextStyles.body.copyWith(
                                    color: AppColors.textPrimary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),

                              Switch.adaptive(
                                value: true,
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        AppButton(
          label: "Sair da conta",
          fullWidth: true,
          borderColor: AppColors.error,
          backgroundColor: AppColors.background,
          labelColor: AppColors.error,
        ),
      ],
    );
  }
}
