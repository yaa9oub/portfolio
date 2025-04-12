import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/constants/texts.dart';
import 'package:portfolio/presentation/widgets/my_tab.dart';
import 'package:portfolio/presentation/widgets/custom_divider.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String selectedTab;
  final Function(String) onTabSelected;

  const MyAppBar({
    super.key,
    required this.selectedTab,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.secondary, width: 0.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              //main tab
              Container(
                width: 311,
                height: 56,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Text(
                  AppConstants.appName,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
              ),
              const CustomDivider(height: 56),
              //tabs
              MyTab(
                text: "_hello",
                isSelected: selectedTab == "_hello",
                onTap: () => onTabSelected("_hello"),
              ),
              const CustomDivider(height: 56),
              MyTab(
                text: "_about-me",
                isSelected: selectedTab == "_about-me",
                onTap: () => onTabSelected("_about-me"),
              ),
              const CustomDivider(height: 56),
              MyTab(
                text: "_experience",
                isSelected: selectedTab == "_experience",
                onTap: () => onTabSelected("_experience"),
              ),
              const CustomDivider(height: 56),
              MyTab(
                text: "_projects",
                isSelected: selectedTab == "_projects",
                onTap: () => onTabSelected("_projects"),
              ),
              const CustomDivider(height: 56),
            ],
          ),
          Row(
            children: [
              const CustomDivider(height: 56),
              MyTab(
                text: "_contact-me",
                isSelected: selectedTab == "_contact-me",
                onTap: () => onTabSelected("_contact-me"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}
