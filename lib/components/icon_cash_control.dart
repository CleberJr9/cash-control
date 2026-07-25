import 'package:flutter/material.dart';

class IconCashControl extends StatelessWidget {
  final double size;
  final Color color;
  final Color iconColor;
  const IconCashControl({
    super.key,
    required this.size,
    required this.color,
    required this.iconColor,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(Icons.attach_money, color: iconColor, size: size / 2)],
      ),
    );
  }
}
