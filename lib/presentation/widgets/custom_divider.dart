import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/colors.dart';

class CustomDivider extends StatelessWidget {
  final bool isVertical;
  final double? width;
  final double? height;
  final Color? color;
  final double thickness;

  const CustomDivider({
    super.key,
    this.isVertical = true,
    this.width,
    this.height,
    this.color,
    this.thickness = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isVertical ? thickness : width,
      height: isVertical ? height : thickness,
      color: color ?? AppColors.stroke,
    );
  }
}
