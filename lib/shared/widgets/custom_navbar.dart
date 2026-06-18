import 'package:cash_control/assets/icons/icons_app.dart';
import 'package:cash_control/components/icon_svg.dart';
import 'package:cash_control/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class NavbarCashControl extends StatelessWidget {
  final String page;
  const NavbarCashControl({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.border,
            width: 2,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 2,
            children: [
              CustomSvgIcon(
                svgString: SvgIcons.homeIcon,
                color: page == 'Inicío'
                    ? AppColors.primary
                    : AppColors.textMuted,
                size: 24,
              ),
              Text(
                'Inicío',
                style: TextStyle(
                  fontSize: 12,
                  color: page == 'Inicío'
                      ? AppColors.primary
                      : AppColors.textMuted,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 2,
            children: [
              CustomSvgIcon(
                svgString: SvgIcons.textLeftIcon,
                color: page == 'Despesas'
                    ? AppColors.primary
                    : AppColors.textMuted,
                size: 24,
              ),
              Text(
                'Despesas',
                style: TextStyle(
                  fontSize: 12,
                  color: page == 'Despesas'
                      ? AppColors.primary
                      : AppColors.textMuted,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 2,
            children: [
              CustomSvgIcon(
                svgString: SvgIcons.profileUserIcon,
                color: page == 'Perfil'
                    ? AppColors.primary
                    : AppColors.textMuted,
                size: 24,
              ),
              Text(
                'Perfil',
                style: TextStyle(
                  fontSize: 12,
                  color: page == 'Perfil'
                      ? AppColors.primary
                      : AppColors.textMuted,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
