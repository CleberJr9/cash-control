import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvgIcon extends StatelessWidget {
  const CustomSvgIcon({
    super.key,
    this.width,
    this.height,
    required this.svgString,
    required this.color,
    required this.size,
  });

  final double? width;
  final double? height;
  final String svgString;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? size,
      height: height ?? size,
      child: SvgPicture.string(
        svgString,
        width: width ?? size,
        height: height ?? size,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
    );
  }
}
