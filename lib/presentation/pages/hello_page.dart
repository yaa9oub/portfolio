import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/core/constants/code.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/constants/texts.dart';
import 'package:portfolio/presentation/widgets/syntax_highlighter.dart';

class HelloPage extends StatelessWidget {
  const HelloPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 250),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello y'all. I am",
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
                Text(
                  "Seyf Yacoub",
                  style: AppTextStyles.headingLarge.copyWith(
                    color: AppColors.tertiary,
                  ),
                ),
                Text(
                  "> Software Engineer",
                  style: AppTextStyles.headingMedium.copyWith(
                    color: AppColors.indigo,
                  ),
                ),
                Text(
                  "> Mobile Developer",
                  style: AppTextStyles.headingMedium.copyWith(
                    color: AppColors.pink,
                  ),
                ),
                Text(
                  "> Flutter Enthusiast",
                  style: AppTextStyles.headingMedium.copyWith(
                    color: AppColors.stroke2,
                  ),
                ),

                SizedBox(height: 56),
                Text(
                  "// tools I use daily",
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
                SizedBox(height: 8),
                SyntaxHighlighter(code: dailyToolsCode),
                // Row(
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //     Text(
                //       "var ",
                //       style: AppTextStyles.bodyMedium.copyWith(
                //         color: AppColors.indigo,
                //       ),
                //     ),
                //     Text(
                //       " githubLink ",
                //       style: AppTextStyles.bodyMedium.copyWith(
                //         color: AppColors.teal,
                //       ),
                //     ),
                //     Text(
                //       " = ",
                //       style: AppTextStyles.bodyMedium.copyWith(
                //         color: AppColors.tertiary,
                //       ),
                //     ),
                //     Text(
                //       '"https://github.com/yaa9oub"',
                //       style: AppTextStyles.bodyMedium.copyWith(
                //         color: AppColors.pink,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              Positioned(
                top: 150,
                right: 450,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.teal2,
                        blurRadius: 120,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 230,
                right: 150,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.indigo,
                        blurRadius: 200,
                        offset: Offset(0, 5),
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
                        blurRadius: 200,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 500,
                  height: 600,
                  child: Image.asset(AppAssets.me),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
