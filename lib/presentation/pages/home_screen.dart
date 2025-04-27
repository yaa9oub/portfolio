import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/presentation/widgets/footer.dart';
import 'package:portfolio/presentation/widgets/my_app_bar.dart';
import 'package:portfolio/presentation/pages/hello_page.dart';
import 'package:portfolio/presentation/pages/about_me_page.dart';
import 'package:portfolio/presentation/pages/experience_page.dart';
import 'package:portfolio/presentation/pages/projects_page.dart';
import 'package:portfolio/presentation/pages/contact_me_page.dart';
import 'package:portfolio/core/constants/app_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedTab = AppConstants.helloTabId;

  void _handleTabSelection(String tab) {
    setState(() {
      _selectedTab = tab;
    });
  }

  Widget _buildBody() {
    switch (_selectedTab) {
      case AppConstants.helloTabId:
        return const HelloPage();
      case AppConstants.aboutMeTabId:
        return const AboutMePage();
      case AppConstants.experienceTabId:
        return const ExperiencePage();
      case AppConstants.projectsTabId:
        return const ProjectsPage();
      case AppConstants.contactMeTabId:
        return const ContactMePage();
      default:
        return const HelloPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        selectedTab: _selectedTab,
        onTabSelected: _handleTabSelection,
      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: AppColors.secondary,
              width: AppConstants.defaultBorderWidth,
            ),
            right: BorderSide(
              color: AppColors.secondary,
              width: AppConstants.defaultBorderWidth,
            ),
          ),
        ),
        child: _buildBody(),
      ),
      bottomNavigationBar: const MyFooter(),
    );
  }
}
