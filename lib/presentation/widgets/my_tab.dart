import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/constants/texts.dart';

class MyTab extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback? onTap;
  final bool isLink;
  final bool isMobile;

  const MyTab({
    super.key,
    required this.text,
    this.isSelected = false,
    this.onTap,
    this.isLink = false,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: isLink ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 56,
          width: isMobile ? Get.width : null,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            border:
                isMobile
                    ? Border.all(
                      color:
                          isSelected ? AppColors.stroke2 : AppColors.tertiary,
                    )
                    : Border(
                      bottom: BorderSide(
                        color:
                            isSelected ? AppColors.stroke2 : Colors.transparent,
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
