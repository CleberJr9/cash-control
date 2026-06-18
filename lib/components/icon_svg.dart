import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvgIcon extends StatefulWidget {
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
  State<CustomSvgIcon> createState() => _CustomSvgIconState();
}

class _CustomSvgIconState extends State<CustomSvgIcon> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? widget.size,
      height: widget.height ?? widget.size,
      child: SvgPicture.string(
        widget.svgString,
        color: widget.color,
        width: widget.width ?? widget.size,
        height: widget.height ?? widget.size,
      ),
    );
  }
}
