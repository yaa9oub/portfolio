import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/core/constants/code.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/constants/texts.dart';
import 'package:portfolio/presentation/widgets/syntax_highlighter.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/app_data.dart';

class HelloPage extends StatelessWidget {
  const HelloPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth <= AppConstants.mobileMaxWidth;
        final content = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppData.helloGreeting,
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.secondary,
                fontSize: isMobile ? 15 : 20,
              ),
            ),
            Text(
              AppData.helloName,
              style: AppTextStyles.headingLarge.copyWith(
                color: AppColors.tertiary,
                fontSize: isMobile ? 50 : 60,
              ),
            ),
            Text(
              AppData.helloRole1,
              style: AppTextStyles.headingMedium.copyWith(
                color: AppColors.indigo,
                fontSize: isMobile ? 20 : 30,
              ),
            ),
            Text(
              AppData.helloRole2,
              style: AppTextStyles.headingMedium.copyWith(
                color: AppColors.pink,
                fontSize: isMobile ? 20 : 30,
              ),
            ),
            Text(
              AppData.helloRole3,
              style: AppTextStyles.headingMedium.copyWith(
                color: AppColors.stroke2,
                fontSize: isMobile ? 20 : 30,
              ),
            ),
            const SizedBox(height: 56),
            Text(
              AppData.helloToolsComment,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.secondary,
              ),
            ),
            const SizedBox(height: AppConstants.defaultBorderRadius),
            SyntaxHighlighter(code: dailyToolsCode),
          ],
        );

        final backgroundElements = Stack(
          children: [
            Positioned(
              top: 100,
              right: 400,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.teal2,
                      blurRadius: AppConstants.smallBlurRadius,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 230,
              right: 350,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.indigo,
                      blurRadius: AppConstants.mediumBlurRadius,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 150,
              right: 400,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.indigo,
                      blurRadius: AppConstants.mediumBlurRadius,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );

        final imageSection = Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 500,
            height: isMobile ? 400 : 600,
            child: Image.asset(AppAssets.me, fit: BoxFit.fitHeight),
          ),
        );

        if (isMobile) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: content,
                ),
                const SizedBox(height: 40),
                SizedBox(
                  height: 500,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 100,
                        right: 20,
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.teal2,
                                blurRadius: AppConstants.smallBlurRadius,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 200,
                        left: 20,
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.indigo,
                                blurRadius: AppConstants.smallBlurRadius,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                        ),
                      ),
                      imageSection,
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          );
        }

        return Stack(
          children: [
            backgroundElements,
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: Get.width * 0.1),
                    child: content,
                  ),
                ),
                Expanded(child: imageSection),
              ],
            ),
          ],
        );
      },
    );
  }
}
