import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/constants/texts.dart';

class MyTab extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback? onTap;
  final bool isLink;

  const MyTab({
    super.key,
    required this.text,
    this.isSelected = false,
    this.onTap,
    this.isLink = false,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: isLink ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? AppColors.stroke2 : Colors.transparent,
                width: 3,
              ),
            ),
          ),
          child: Text(
            text,
            style: AppTextStyles.bodyMedium.copyWith(
              color: isSelected ? AppColors.tertiary : AppColors.secondary,
            ),
          ),
        ),
      ),
    );
  }
}
