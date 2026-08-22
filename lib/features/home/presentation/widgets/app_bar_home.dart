import 'package:cash_control/assets/icons/fonts/font_app.dart';
import 'package:cash_control/core/theme/app_colors.dart';
import 'package:cash_control/core/theme/utils/first_index_name.dart';
import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget {
  final String nameUser;
  final String month;
  const AppBarHome({super.key, required this.nameUser, required this.month});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [
              Text(
                "Olá, $nameUser",
                style: AppTextStyles.body.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                month,
                style: AppTextStyles.heading.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,

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
                      firstIndexName(nameUser),
                      style: AppTextStyles.title.copyWith(
                        color: AppColors.primary,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
