import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/presentation/widgets/footer.dart';
import 'package:portfolio/presentation/widgets/my_app_bar.dart';
import 'package:portfolio/presentation/pages/hello_page.dart';
import 'package:portfolio/presentation/pages/about_me_page.dart';
import 'package:portfolio/presentation/pages/experience_page.dart';
import 'package:portfolio/presentation/pages/projects_page.dart';
import 'package:portfolio/presentation/pages/contact_me_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedTab = "_about-me";

  void _handleTabSelection(String tab) {
    setState(() {
      _selectedTab = tab;
    });
  }

  Widget _buildBody() {
    switch (_selectedTab) {
      case "_hello":
        return const HelloPage();
      case "_about-me":
        return const AboutMePage();
      case "_experience":
        return const ExperiencePage();
      case "_projects":
        return const ProjectsPage();
      case "_contact-me":
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
            left: BorderSide(color: AppColors.secondary, width: 0.5),
            right: BorderSide(color: AppColors.secondary, width: 0.5),
          ),
        ),
        child: _buildBody(),
      ),
      bottomNavigationBar: const MyFooter(),
    );
  }
}
