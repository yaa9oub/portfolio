import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth <= 600;
        return isMobile
            ? Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.secondary, width: 0.5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //main tab
                      Container(
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
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Get.bottomSheet(
                        Container(
                          // height: Get.height * 0.6,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            border: Border.all(
                              color: AppColors.secondary,
                              width: 0.5,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 10,
                            children: [
                              MyTab(
                                text: "_hello",
                                isMobile: true,
                                isSelected: selectedTab == "_hello",
                                onTap: () {
                                  onTabSelected("_hello");
                                  Get.back();
                                },
                              ),
                              MyTab(
                                text: "_about-me",
                                isMobile: true,
                                isSelected: selectedTab == "_about-me",
                                onTap: () {
                                  onTabSelected("_about-me");
                                  Get.back();
                                },
                              ),
                              MyTab(
                                text: "_experience",
                                isMobile: true,
                                isSelected: selectedTab == "_experience",
                                onTap: () {
                                  onTabSelected("_experience");
                                  Get.back();
                                },
                              ),
                              MyTab(
                                text: "_projects",
                                isMobile: true,
                                isSelected: selectedTab == "_projects",
                                onTap: () {
                                  onTabSelected("_projects");
                                  Get.back();
                                },
                              ),
                              MyTab(
                                text: "_contact-me",
                                isMobile: true,
                                isSelected: selectedTab == "_contact-me",
                                onTap: () {
                                  onTabSelected("_contact-me");
                                  Get.back();
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CustomDivider(height: 56),
                        Container(
                          height: 56,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                          child: Icon(Icons.menu, color: AppColors.secondary),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
            : Container(
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
      },
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}
