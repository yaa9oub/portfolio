import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/constants/texts.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/app_data.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, Map<String, dynamic>> folderData = AppData.projectsData;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < AppConstants.mobileMaxWidth;
        return Stack(
          children: [
            Positioned(
              top: isMobile ? 100 : 150,
              left: isMobile ? 100 : 700,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.teal2,
                      blurRadius:
                          isMobile
                              ? AppConstants.largeBlurRadius
                              : AppConstants.smallBlurRadius,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: isMobile ? 170 : 230,
              right: isMobile ? 100 : 700,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.indigo,
                      blurRadius:
                          isMobile
                              ? AppConstants.largeBlurRadius
                              : AppConstants.mediumBlurRadius,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 150,
              left: 600,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.pink,
                      blurRadius: AppConstants.mediumBlurRadius,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                width: 600,
                height: Get.height,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.hugePadding,
                  vertical: AppConstants.hugePadding,
                ),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children:
                      folderData.keys.map((folderName) {
                        final projectInfo = folderData[folderName]!;
                        final screenshots =
                            projectInfo["screenshots"] as List? ?? [];
                        final icon = projectInfo["icon"] as String?;

                        return GestureDetector(
                          onTap: () {
                            if (screenshots.isEmpty) {
                              Get.dialog(
                                Center(
                                  child: Material(
                                    color: Colors.transparent,
                                    child: Container(
                                      width: isMobile ? Get.width - 10 : 450,
                                      height: 450,
                                      decoration: BoxDecoration(
                                        color: AppColors.primary.withAlpha(100),
                                        borderRadius: BorderRadius.circular(
                                          AppConstants.defaultBorderRadius,
                                        ),
                                        border: Border.all(
                                          color: AppColors.stroke,
                                          width: AppConstants.thickBorderWidth,
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        children: [
                                          Text(
                                            AppData.noScreenshotsTitle,
                                            style: AppTextStyles.headingMedium
                                                .copyWith(
                                                  color: AppColors.pink,
                                                ),
                                          ),
                                          const SizedBox(height: 20),
                                          Image.network(
                                            AppData.noScreenshotsGifUrl,
                                            width: 300,
                                            height: 250,
                                          ),
                                          const SizedBox(height: 20),
                                          Text(
                                            AppData.noScreenshotsMessage,
                                            style: AppTextStyles.bodyMedium
                                                .copyWith(
                                                  color: AppColors.tertiary,
                                                ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              final pageController = PageController();
                              Get.dialog(
                                Center(
                                  child: Material(
                                    color: Colors.transparent,
                                    child: Container(
                                      width:
                                          isMobile
                                              ? Get.width - 10
                                              : Get.width * 0.2,
                                      height: Get.height * 0.8,
                                      decoration: BoxDecoration(
                                        color: AppColors.primary.withAlpha(100),
                                        borderRadius: BorderRadius.circular(
                                          AppConstants.defaultBorderRadius,
                                        ),
                                        border: Border.all(
                                          color: AppColors.stroke,
                                          width: AppConstants.thickBorderWidth,
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                folderName,
                                                style: AppTextStyles.bodyLarge
                                                    .copyWith(
                                                      color: AppColors.pink,
                                                    ),
                                              ),
                                              IconButton(
                                                onPressed: () => Get.back(),
                                                icon: Icon(
                                                  Icons.close,
                                                  color: AppColors.tertiary,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 20),
                                          Expanded(
                                            child: PageView.builder(
                                              controller: pageController,
                                              itemCount: screenshots.length,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  margin:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                      ),
                                                  child: Image.asset(
                                                    screenshots[index],
                                                    fit: BoxFit.contain,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  pageController.previousPage(
                                                    duration:
                                                        AppConstants
                                                            .defaultAnimationDuration,
                                                    curve: Curves.easeInOut,
                                                  );
                                                },
                                                icon: Icon(
                                                  Icons.arrow_back_ios,
                                                  color: AppColors.tertiary,
                                                ),
                                              ),
                                              const SizedBox(width: 20),
                                              IconButton(
                                                onPressed: () {
                                                  pageController.nextPage(
                                                    duration:
                                                        AppConstants
                                                            .defaultAnimationDuration,
                                                    curve: Curves.easeInOut,
                                                  );
                                                },
                                                icon: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: AppColors.tertiary,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                          child: SizedBox(
                            width: 120,
                            height: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                icon != null
                                    ? Container(
                                      width: AppConstants.defaultIconSize,
                                      height: AppConstants.defaultIconSize,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.tertiary,
                                        image: DecorationImage(
                                          image: AssetImage(icon),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    )
                                    : Icon(
                                      CupertinoIcons.flag_circle,
                                      color: AppColors.teal,
                                      size: AppConstants.defaultIconSize,
                                    ),
                                Text(
                                  folderName,
                                  style: AppTextStyles.bodyMedium.copyWith(
                                    color: AppColors.tertiary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
