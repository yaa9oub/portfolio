import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/constants/texts.dart';
import 'package:portfolio/core/constants/code.dart';
import 'package:portfolio/presentation/controllers/about_me_controller.dart';
import 'package:portfolio/presentation/widgets/custom_divider.dart';
import 'package:portfolio/presentation/widgets/files_system.dart';
import 'package:portfolio/presentation/widgets/syntax_highlighter.dart';

class AboutMePage extends GetView<AboutMeController> {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AboutMeController());
    return LayoutBuilder(
      builder: (context, constraints) {
        var isMobile = constraints.maxWidth < 600;
        return isMobile
            ? SizedBox(
              width: Get.width,
              height: Get.height,
              child: ListView(
                children: [
                  FilesSystem(controller: controller, isMobile: isMobile),
                  CodeViewer(controller: controller, isMobile: isMobile),
                ],
              ),
            )
            : Row(
              children: [
                //files system
                FilesSystem(controller: controller),
                Expanded(
                  child: ListView(
                    children: [
                      //opened files
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Obx(
                            () => Row(
                              children: [
                                ...controller.openedFiles.map(
                                  (file) => GestureDetector(
                                    onTap: () => controller.selectFile(file),
                                    child: Container(
                                      width: 200,
                                      height: 56,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 24,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            color: AppColors.secondary,
                                            width: 0.5,
                                          ),
                                        ),
                                        color:
                                            controller.selectedFile.value ==
                                                    file
                                                ? AppColors.primary.withOpacity(
                                                  0.1,
                                                )
                                                : null,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            file,
                                            style: AppTextStyles.bodyMedium
                                                .copyWith(
                                                  color: AppColors.secondary,
                                                ),
                                          ),
                                          GestureDetector(
                                            onTap:
                                                () =>
                                                    controller.closeFile(file),
                                            child: Icon(
                                              Icons.close_rounded,
                                              color: AppColors.secondary,
                                              size: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      CustomDivider(
                        width: double.infinity,
                        thickness: 0.5,
                        isVertical: false,
                      ),
                      CodeViewer(controller: controller),
                    ],
                  ),
                ),
              ],
            );
      },
    );
  }
}

class CodeViewer extends StatelessWidget {
  const CodeViewer({
    super.key,
    required this.controller,
    this.isMobile = false,
  });

  final bool isMobile;
  final AboutMeController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => SizedBox(
            width: isMobile ? Get.width - 10 : Get.width * 0.5,
            child:
                controller.selectedFile.value == "bio"
                    ? BioPage()
                    : controller.selectedFile.value == "interests"
                    ? InterestsPage()
                    : controller.selectedFile.value == "high-school"
                    ? HighSchoolPage()
                    : controller.selectedFile.value == "university"
                    ? UniversityPage()
                    : controller.selectedFile.value == "scholarships"
                    ? ScholarshipPage()
                    : controller.selectedFile.value == "clubs"
                    ? ClubsPage()
                    : SizedBox(),
          ),
        ),
        if (!isMobile) CustomDivider(height: Get.height * 0.8, thickness: 0.5),
        if (!isMobile) Spacer(),
      ],
    );
  }
}

class FilesSystem extends StatelessWidget {
  const FilesSystem({
    super.key,
    required this.controller,
    this.isMobile = false,
  });

  final AboutMeController controller;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isMobile ? Get.width : 311,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.stroke, width: 0.5),
      ),
      child: Column(
        children: [
          ProjectItem(
            title: "about-me",
            onFileTap: controller.openFile,
            children: [
              FolderItem(
                title: "personal-info",
                color: AppColors.indigo,
                onFileTap: controller.openFile,
                children: [
                  FileItem(
                    title: "bio",
                    onTap: () => controller.openFile("bio"),
                  ),
                  FileItem(
                    title: "interests",
                    onTap: () => controller.openFile("interests"),
                  ),
                ],
              ),
              FolderItem(
                title: "education",
                color: AppColors.teal,
                onFileTap: controller.openFile,
                children: [
                  FileItem(
                    title: "high-school",
                    onTap: () => controller.openFile("high-school"),
                  ),
                  FileItem(
                    title: "university",
                    onTap: () => controller.openFile("university"),
                  ),
                  FileItem(
                    title: "scholarships",
                    onTap: () => controller.openFile("scholarships"),
                  ),
                  FileItem(
                    title: "clubs",
                    onTap: () => controller.openFile("clubs"),
                  ),
                ],
              ),
            ],
          ),
          CustomDivider(
            width: double.infinity,
            isVertical: false,
            thickness: 0.5,
          ),
          ProjectItem(
            title: "contacts",
            onFileTap: controller.openFile,
            children: [
              FileItem(
                title: "seyf.yagoub@gmail.com",
                icon: Icons.email_rounded,
              ),
              FileItem(title: "(+216) 99 101 001", icon: Icons.phone_android),
            ],
          ),
        ],
      ),
    );
  }
}

class ClubsPage extends StatelessWidget {
  const ClubsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Line numbers gutter
          Container(
            width: 48,
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: AppColors.secondary, width: 0.5),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(
                34,
                (index) => Text(
                  '${index + 1}',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.secondary.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            child: SyntaxHighlighter(code: clubs),
          ),
        ],
      ),
    );
  }
}

class ScholarshipPage extends StatelessWidget {
  const ScholarshipPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Line numbers gutter
          Container(
            width: 48,
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: AppColors.secondary, width: 0.5),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(
                36,
                (index) => Text(
                  '${index + 1}',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.secondary.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            child: SyntaxHighlighter(code: scholarships),
          ),
        ],
      ),
    );
  }
}

class UniversityPage extends StatelessWidget {
  const UniversityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Line numbers gutter
          Container(
            width: 48,
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: AppColors.secondary, width: 0.5),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(
                30,
                (index) => Text(
                  '${index + 1}',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.secondary.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            child: SyntaxHighlighter(code: universityCode),
          ),
        ],
      ),
    );
  }
}

class HighSchoolPage extends StatelessWidget {
  const HighSchoolPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Line numbers gutter
          Container(
            width: 48,
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: AppColors.secondary, width: 0.5),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(
                30,
                (index) => Text(
                  '${index + 1}',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.secondary.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            child: SyntaxHighlighter(code: highSchoolCode),
          ),
        ],
      ),
    );
  }
}

class InterestsPage extends StatelessWidget {
  const InterestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Line numbers gutter
          Container(
            width: 48,
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: AppColors.secondary, width: 0.5),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(
                30,
                (index) => Text(
                  '${index + 1}',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.secondary.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            child: SyntaxHighlighter(code: interestsCode),
          ),
        ],
      ),
    );
  }
}

class BioPage extends StatelessWidget {
  const BioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Line numbers gutter
          Container(
            width: 48,
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: AppColors.secondary, width: 0.5),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(
                33,
                (index) => Text(
                  '${index + 1}',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.secondary.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          // Code content
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "/*\nAbout me,\nI wrote my first line of code in 2016,\nit was a simple Hello World print using python,\nnow I have helped countless clients launch their mobile applications.\n\nI tried different languages and frameworks along the way \nbut Flutter felt very special to me and since 2019 I never stopped bringing ideas to life with it.\n\nI'm not a typical developer who only knows how to code WOOOW applications.\n\nWhat I got is curiosity, very much of it.\nEager to prove myself and to prove you wrong.\nTeam player but also I got leader instincts.\nChallenger, so challenge me as much as you can, if it's a good one I will not sleep until I either finish the challenge or die.\n\nthis bio is just for fun, don't take it too serious.\n*/\n\n",
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                  PersoClass(
                    photoUrl: "'assets/images/seyf.png'",
                    name: "'Seyf'",
                    lastName: 'Yacoub',
                    age: '25',
                    nationality: "'Tunisian'",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PersoClass extends StatelessWidget {
  const PersoClass({
    super.key,
    required this.photoUrl,
    required this.name,
    required this.lastName,
    required this.age,
    required this.nationality,
  });
  final String photoUrl;
  final String name;
  final String lastName;
  final String age;
  final String nationality;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.secondary,
          height: 1.45,
        ),
        children: [
          TextSpan(text: 'class ', style: TextStyle(color: AppColors.indigo)),
          TextSpan(text: 'AboutMe ', style: TextStyle(color: AppColors.teal2)),
          TextSpan(text: '{\n  ', style: TextStyle(color: AppColors.stroke2)),
          TextSpan(text: 'String ', style: TextStyle(color: AppColors.indigo)),
          TextSpan(text: 'photoUrl ', style: TextStyle(color: AppColors.teal2)),
          TextSpan(text: '= ', style: TextStyle(color: AppColors.stroke2)),
          TextSpan(text: photoUrl, style: TextStyle(color: AppColors.pink)),
          TextSpan(text: ';', style: TextStyle(color: AppColors.stroke2)),
          TextSpan(text: '\n  ', style: TextStyle(color: AppColors.secondary)),
          TextSpan(text: 'String ', style: TextStyle(color: AppColors.indigo)),
          TextSpan(text: 'name ', style: TextStyle(color: AppColors.teal2)),
          TextSpan(text: '= ', style: TextStyle(color: AppColors.stroke2)),
          TextSpan(text: name, style: TextStyle(color: AppColors.pink)),
          TextSpan(text: ';', style: TextStyle(color: AppColors.stroke2)),
          TextSpan(text: '\n  ', style: TextStyle(color: AppColors.secondary)),
          TextSpan(text: 'String ', style: TextStyle(color: AppColors.indigo)),
          TextSpan(text: 'lastName ', style: TextStyle(color: AppColors.teal2)),
          TextSpan(text: '= ', style: TextStyle(color: AppColors.stroke2)),
          TextSpan(text: lastName, style: TextStyle(color: AppColors.pink)),
          TextSpan(text: ';', style: TextStyle(color: AppColors.stroke2)),
          TextSpan(text: '\n  ', style: TextStyle(color: AppColors.secondary)),
          TextSpan(text: 'String ', style: TextStyle(color: AppColors.indigo)),
          TextSpan(text: 'age ', style: TextStyle(color: AppColors.teal2)),
          TextSpan(text: '= ', style: TextStyle(color: AppColors.stroke2)),
          TextSpan(
            text: age,
            style: TextStyle(
              color: AppColors.teal,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.pink,
              decorationThickness: 3,
              decorationStyle: TextDecorationStyle.wavy,
            ),
          ),
          TextSpan(text: ';', style: TextStyle(color: AppColors.stroke2)),
          TextSpan(text: '\n  ', style: TextStyle(color: AppColors.secondary)),
          TextSpan(text: 'String ', style: TextStyle(color: AppColors.indigo)),
          TextSpan(
            text: 'nationality ',
            style: TextStyle(color: AppColors.teal2),
          ),
          TextSpan(text: '= ', style: TextStyle(color: AppColors.stroke2)),
          TextSpan(text: nationality, style: TextStyle(color: AppColors.pink)),
          TextSpan(text: ';', style: TextStyle(color: AppColors.stroke2)),
          TextSpan(text: '\n', style: TextStyle(color: AppColors.secondary)),
          TextSpan(text: '}', style: TextStyle(color: AppColors.stroke2)),
        ],
      ),
    );
  }
}
