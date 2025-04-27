import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/constants/texts.dart';
import 'package:portfolio/core/constants/code.dart';
import 'package:portfolio/presentation/controllers/about_me_controller.dart';
import 'package:portfolio/presentation/widgets/custom_divider.dart';
import 'package:portfolio/presentation/widgets/files_system.dart';
import 'package:portfolio/presentation/widgets/syntax_highlighter.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/app_data.dart';

class AboutMePage extends GetView<AboutMeController> {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AboutMeController());
    return LayoutBuilder(
      builder: (context, constraints) {
        var isMobile = constraints.maxWidth < AppConstants.mobileMaxWidth;
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
                                  (fileId) => GestureDetector(
                                    onTap: () => controller.selectFile(fileId),
                                    child: Container(
                                      width: 200,
                                      height: 56,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: AppConstants.largePadding,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            color: AppColors.secondary,
                                            width:
                                                AppConstants.defaultBorderWidth,
                                          ),
                                        ),
                                        color:
                                            controller.selectedFile.value ==
                                                    fileId
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
                                            fileId,
                                            style: AppTextStyles.bodyMedium
                                                .copyWith(
                                                  color: AppColors.secondary,
                                                ),
                                          ),
                                          GestureDetector(
                                            onTap:
                                                () => controller.closeFile(
                                                  fileId,
                                                ),
                                            child: Icon(
                                              Icons.close_rounded,
                                              color: AppColors.secondary,
                                              size: AppConstants.smallIconSize,
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
                        thickness: AppConstants.defaultBorderWidth,
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
                controller.selectedFile.value == AppConstants.bioFileId
                    ? BioPage()
                    : controller.selectedFile.value ==
                        AppConstants.interestsFileId
                    ? InterestsPage()
                    : controller.selectedFile.value ==
                        AppConstants.highSchoolFileId
                    ? HighSchoolPage()
                    : controller.selectedFile.value ==
                        AppConstants.universityFileId
                    ? UniversityPage()
                    : controller.selectedFile.value ==
                        AppConstants.scholarshipsFileId
                    ? ScholarshipPage()
                    : controller.selectedFile.value == AppConstants.clubsFileId
                    ? ClubsPage()
                    : SizedBox(),
          ),
        ),
        if (!isMobile)
          CustomDivider(
            height: Get.height * 0.8,
            thickness: AppConstants.defaultBorderWidth,
          ),
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
        border: Border.all(
          color: AppColors.stroke,
          width: AppConstants.defaultBorderWidth,
        ),
      ),
      child: Column(
        children: [
          ProjectItem(
            title: AppData.aboutMeSectionTitle,
            onFileTap: controller.openFile,
            children: [
              FolderItem(
                title: AppData.personalInfoFolderTitle,
                color: AppColors.indigo,
                onFileTap: controller.openFile,
                children: [
                  FileItem(
                    title: AppData.bioFileTitle,
                    onTap: () => controller.openFile(AppConstants.bioFileId),
                  ),
                  FileItem(
                    title: AppData.interestsFileTitle,
                    onTap:
                        () => controller.openFile(AppConstants.interestsFileId),
                  ),
                ],
              ),
              FolderItem(
                title: AppData.educationFolderTitle,
                color: AppColors.teal,
                onFileTap: controller.openFile,
                children: [
                  FileItem(
                    title: AppData.highSchoolFileTitle,
                    onTap:
                        () =>
                            controller.openFile(AppConstants.highSchoolFileId),
                  ),
                  FileItem(
                    title: AppData.universityFileTitle,
                    onTap:
                        () =>
                            controller.openFile(AppConstants.universityFileId),
                  ),
                  FileItem(
                    title: AppData.scholarshipsFileTitle,
                    onTap:
                        () => controller.openFile(
                          AppConstants.scholarshipsFileId,
                        ),
                  ),
                  FileItem(
                    title: AppData.clubsFileTitle,
                    onTap: () => controller.openFile(AppConstants.clubsFileId),
                  ),
                ],
              ),
            ],
          ),
          CustomDivider(
            width: double.infinity,
            isVertical: false,
            thickness: AppConstants.defaultBorderWidth,
          ),
          ProjectItem(
            title: AppData.contactsSectionTitle,
            onFileTap: controller.openFile,
            children: [
              FileItem(title: AppData.emailContact, icon: Icons.email_rounded),
              FileItem(title: AppData.phoneContact, icon: Icons.phone_android),
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
            padding: const EdgeInsets.only(
              left: AppConstants.defaultBorderRadius,
              right: AppConstants.defaultBorderRadius,
              top: AppConstants.defaultBorderRadius,
            ),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: AppColors.secondary,
                  width: AppConstants.defaultBorderWidth,
                ),
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
            padding: const EdgeInsets.only(
              left: AppConstants.defaultBorderRadius,
              right: AppConstants.defaultBorderRadius,
              top: AppConstants.defaultBorderRadius,
            ),
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
            padding: const EdgeInsets.only(
              left: AppConstants.defaultBorderRadius,
              right: AppConstants.defaultBorderRadius,
              top: AppConstants.defaultBorderRadius,
            ),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: AppColors.secondary,
                  width: AppConstants.defaultBorderWidth,
                ),
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
            padding: const EdgeInsets.only(
              left: AppConstants.defaultBorderRadius,
              right: AppConstants.defaultBorderRadius,
              top: AppConstants.defaultBorderRadius,
            ),
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
            padding: const EdgeInsets.only(
              left: AppConstants.defaultBorderRadius,
              right: AppConstants.defaultBorderRadius,
              top: AppConstants.defaultBorderRadius,
            ),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: AppColors.secondary,
                  width: AppConstants.defaultBorderWidth,
                ),
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
            padding: const EdgeInsets.only(
              left: AppConstants.defaultBorderRadius,
              right: AppConstants.defaultBorderRadius,
              top: AppConstants.defaultBorderRadius,
            ),
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
            padding: const EdgeInsets.only(
              left: AppConstants.defaultBorderRadius,
              right: AppConstants.defaultBorderRadius,
              top: AppConstants.defaultBorderRadius,
            ),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: AppColors.secondary,
                  width: AppConstants.defaultBorderWidth,
                ),
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
            padding: const EdgeInsets.only(
              left: AppConstants.defaultBorderRadius,
              right: AppConstants.defaultBorderRadius,
              top: AppConstants.defaultBorderRadius,
            ),
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
            padding: const EdgeInsets.only(
              left: AppConstants.defaultBorderRadius,
              right: AppConstants.defaultBorderRadius,
              top: AppConstants.defaultBorderRadius,
            ),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: AppColors.secondary,
                  width: AppConstants.defaultBorderWidth,
                ),
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
            padding: const EdgeInsets.only(
              left: AppConstants.defaultBorderRadius,
              right: AppConstants.defaultBorderRadius,
              top: AppConstants.defaultBorderRadius,
            ),
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
            padding: const EdgeInsets.only(
              left: AppConstants.defaultBorderRadius,
              right: AppConstants.defaultBorderRadius,
              top: AppConstants.defaultBorderRadius,
            ),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: AppColors.secondary,
                  width: AppConstants.defaultBorderWidth,
                ),
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
              padding: const EdgeInsets.only(
                left: AppConstants.defaultBorderRadius,
                right: AppConstants.defaultBorderRadius,
                top: AppConstants.defaultBorderRadius,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppData.bioComment,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                  PersoClass(
                    photoUrl: AppData.bioPhotoUrl,
                    name: AppData.bioFirstName,
                    lastName: AppData.bioLastName,
                    age: AppData.bioAge,
                    nationality: AppData.bioNationality,
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
