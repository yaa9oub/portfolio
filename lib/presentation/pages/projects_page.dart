import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/constants/texts.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, Map<String, dynamic>> folderData = {
      "Profiler": {"screenshots": []},
      "Kojo": {"screenshots": []},
      "WeeFarm": {"screenshots": []},
      "Protec": {"screenshots": []},
      "Fas3a": {"screenshots": []},
      "Deeds": {
        "screenshots": [
          AppAssets.deeds1,
          AppAssets.deeds2,
          AppAssets.deeds3,
          AppAssets.deeds4,
          AppAssets.deeds5,
          AppAssets.deeds6,
          AppAssets.deeds7,
          AppAssets.deeds9,
          AppAssets.deeds8,
        ],
      },
      "Stouchi": {"screenshots": []},
      "Gwala": {"screenshots": []},
      "Midibi": {"screenshots": []},
      "Ticka": {"screenshots": []},
      "Convo": {"screenshots": []},
    };

    return Stack(
      children: [
        Positioned(
          top: 150,
          left: 700,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.teal2,
                  blurRadius: 120,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 230,
          right: 700,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.indigo,
                  blurRadius: 200,
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
                  blurRadius: 200,
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
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children:
                  folderData.keys.map((folderName) {
                    return GestureDetector(
                      onTap: () {
                        if ((folderData[folderName]!["screenshots"] as List)
                            .isEmpty) {
                          Get.dialog(
                            Center(
                              child: Material(
                                color: Colors.transparent,
                                child: Container(
                                  width: 450,
                                  height: 450,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary.withAlpha(100),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: AppColors.stroke,
                                      width: 2,
                                    ),
                                  ),
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      Text(
                                        "NO SCREENSHOTS YET",
                                        style: AppTextStyles.headingMedium
                                            .copyWith(color: AppColors.pink),
                                      ),
                                      SizedBox(height: 20),
                                      Image.network(
                                        "https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExd3FoaGVkOXBieml5YWhpZTEwc3AydHByMWkydmZnbXhtdnVmcjlpNyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/3V5xCr3DvoJxRF0HNb/giphy.gif",
                                        width: 300,
                                        height: 250,
                                      ),
                                      SizedBox(height: 20),

                                      Text(
                                        "This project is still under development. I will update this section as soon as I can.",
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
                                  width: Get.width * 0.2,
                                  height: Get.height * 0.8,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary.withAlpha(100),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: AppColors.stroke,
                                      width: 2,
                                    ),
                                  ),
                                  padding: EdgeInsets.all(20),
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
                                      SizedBox(height: 20),
                                      Expanded(
                                        child: PageView.builder(
                                          controller: pageController,
                                          itemCount:
                                              (folderData[folderName]!["screenshots"]
                                                      as List)
                                                  .length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              margin: EdgeInsets.symmetric(
                                                horizontal: 10,
                                              ),
                                              child: Image.asset(
                                                folderData[folderName]!["screenshots"][index],
                                                fit: BoxFit.contain,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              // Handle previous page
                                              pageController.previousPage(
                                                duration: Duration(
                                                  milliseconds: 300,
                                                ),
                                                curve: Curves.easeInOut,
                                              );
                                            },
                                            icon: Icon(
                                              Icons.arrow_back_ios,
                                              color: AppColors.tertiary,
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          IconButton(
                                            onPressed: () {
                                              // Handle next page
                                              pageController.nextPage(
                                                duration: Duration(
                                                  milliseconds: 300,
                                                ),
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
                            Icon(
                              CupertinoIcons.flag_circle,
                              color: AppColors.teal,
                              size: 70,
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
  }
}
