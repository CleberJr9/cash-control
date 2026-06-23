import 'package:cash_control/assets/icons/fonts/font_app.dart';
import 'package:cash_control/core/theme/app_colors.dart';
import 'package:cash_control/core/theme/utils/format_currency.dart';
import 'package:flutter/material.dart';

class CardBalance extends StatefulWidget {
  const CardBalance({
    super.key,
    required this.budget,
    required this.moneySpent,
  });
  final int budget;
  final int moneySpent;
  @override
  State<CardBalance> createState() => CardBalanceState();
}

class CardBalanceState extends State<CardBalance> {
  double get _progress => widget.moneySpent / widget.budget;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 154, minWidth: double.infinity),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8.0,
            spreadRadius: 0.0,
            offset: const Offset(0.0, 0.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              Text(
                "Gasto esse mês",
                style: AppTextStyles.bodyBold.copyWith(
                  color: AppColors.surface,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 16,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Text(
                    formatCurrency(widget.moneySpent),
                    style: AppTextStyles.heading.copyWith(
                      color: AppColors.surface,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: LinearProgressIndicator(
                  value: _progress,
                  backgroundColor: AppColors.segment.withOpacity(0.5),
                  minHeight: 8,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.surface),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formatCurrency(widget.budget - widget.moneySpent),
                style: AppTextStyles.body.copyWith(color: AppColors.surface),
              ),
              Text(
                formatCurrency(widget.budget),
                style: AppTextStyles.body.copyWith(color: AppColors.surface),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
