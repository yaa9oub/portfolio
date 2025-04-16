import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/constants/texts.dart';
import 'package:portfolio/presentation/widgets/my_tab.dart';
import 'package:portfolio/presentation/widgets/custom_divider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;

class MyFooter extends StatelessWidget {
  const MyFooter({super.key});

  Future<void> _launchUrl(String url) async {
    try {
      if (html.window.navigator.userAgent.contains('Firefox')) {
        // For Firefox, we need to use window.open
        html.window.open(url, '_blank');
      } else {
        // For other browsers, we can use the url_launcher
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      }
    } catch (e) {
      debugPrint('Error launching URL: $e');
      // Fallback to window.open if url_launcher fails
      html.window.open(url, '_blank');
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.secondary, width: 0.5),
          ),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Row(
                children: [
                  //main tab
                  Container(
                    height: 56,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    child: Text(
                      "find me in:",
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.secondary,
                      ),
                    ),
                  ),
                  const CustomDivider(height: 56),
                  //social media tabs
                  MyTab(
                    text: "@github",
                    isSelected: false,
                    isLink: true,
                    onTap: () => _launchUrl("https://github.com/yaa9oub"),
                  ),
                  const CustomDivider(height: 56),
                  MyTab(
                    text: "@linkedin",
                    isSelected: false,
                    isLink: true,
                    onTap:
                        () =>
                            _launchUrl("https://linkedin.com/in/your-profile"),
                  ),
                  const CustomDivider(height: 56),
                  MyTab(
                    text: "@youtube",
                    isSelected: false,
                    isLink: true,
                    onTap: () => _launchUrl("https://youtube.com/your-channel"),
                  ),
                  const CustomDivider(height: 56),
                  MyTab(
                    text: "@upwork",
                    isSelected: false,
                    isLink: true,
                    onTap:
                        () => _launchUrl(
                          "https://upwork.com/freelancers/your-profile",
                        ),
                  ),
                  const CustomDivider(height: 56),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
