import 'package:cash_control/components/skelleton.dart';
import 'package:cash_control/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeSkelleton extends StatelessWidget {
  const HomeSkelleton({super.key});

  static const _barHeights = [0.45, 0.70, 0.55, 0.90, 0.62, 1.0, 0.40];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 22,
      children: [
        // header: saudação + avatar
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 9,
              children: [
                SkeletonBox(width: 96, height: 12, radius: 6),
                SkeletonBox(width: 150, height: 22, radius: 7),
              ],
            ),
            SkeletonBox(width: 42, height: 42, radius: 21),
          ],
        ),

        // card de saldo
        const SkeletonBox(height: 156, radius: 24),

        // seletor de período
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: const Color(0xFFEFF0ED),
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Row(
            spacing: 4,
            children: [
              Expanded(child: SkeletonBox(height: 30, radius: 11)),
              Expanded(child: SkeletonBox(height: 30, radius: 11)),
              Expanded(child: SkeletonBox(height: 30, radius: 11)),
            ],
          ),
        ),

        // gráfico
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: AppColors.backgroundContainer,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFECEDE9)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 18,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SkeletonBox(width: 110, height: 12, radius: 6),
                  SkeletonBox(width: 70, height: 16, radius: 6),
                ],
              ),
              SizedBox(
                height: 110,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  spacing: 10,
                  children: _barHeights
                      .map(
                        (h) => Expanded(
                          child: SkeletonBox(height: 110 * h, radius: 7),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),

        // título da seção
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SkeletonBox(width: 140, height: 16, radius: 6),
            SkeletonBox(width: 60, height: 13, radius: 6),
          ],
        ),

        // últimas transações
        Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundContainer,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFECEDE9)),
          ),
          child: const Column(
            children: [
              _SkeletonTile(titleWidth: 0.70, subtitleWidth: 0.40),
              _SkeletonTile(titleWidth: 0.58, subtitleWidth: 0.34),
              _SkeletonTile(titleWidth: 0.76, subtitleWidth: 0.46),
            ],
          ),
        ),
      ],
    );
  }
}

class _SkeletonTile extends StatelessWidget {
  final double titleWidth;
  final double subtitleWidth;

  const _SkeletonTile({required this.titleWidth, required this.subtitleWidth});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
      child: Row(
        spacing: 13,
        children: [
          const SkeletonBox(width: 38, height: 38, radius: 12),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 7,
                children: [
                  SkeletonBox(
                    width: constraints.maxWidth * titleWidth,
                    height: 13,
                    radius: 6,
                  ),
                  SkeletonBox(
                    width: constraints.maxWidth * subtitleWidth,
                    height: 11,
                    radius: 6,
                  ),
                ],
              ),
            ),
          ),
          const SkeletonBox(width: 58, height: 14, radius: 6),
        ],
      ),
    );
  }
}
