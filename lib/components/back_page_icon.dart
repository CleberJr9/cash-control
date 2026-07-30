import 'package:cash_control/assets/icons/icons_app.dart';
import 'package:cash_control/components/icon_svg.dart';
import 'package:cash_control/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BackPageIcon extends StatelessWidget {
  const BackPageIcon({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.disabled, width: 1),
      ),
      height: 42,
      width: 42,
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSvgIcon(
              svgString: SvgIcons.arrowLeftIcon,
              color: AppColors.textSecondary,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
