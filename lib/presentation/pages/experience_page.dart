import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/constants/texts.dart';
import 'package:portfolio/presentation/widgets/custom_divider.dart';
import 'package:portfolio/presentation/controllers/experience_controller.dart';
import 'package:portfolio/core/constants/app_constants.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ExperienceController controller = Get.put(ExperienceController());

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < AppConstants.mobileMaxWidth;
        return Stack(
          children: [
            Positioned(
              // top: 150,
              // left: 700,
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
                      blurRadius: AppConstants.smallBlurRadius,
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
                      blurRadius: AppConstants.mediumBlurRadius,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 100,
              left: 650,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.teal2,
                      blurRadius: AppConstants.mediumBlurRadius,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: Get.width,
              height: Get.height,
              padding: EdgeInsets.symmetric(
                horizontal:
                    isMobile
                        ? AppConstants.largePadding
                        : AppConstants.hugePadding,
                vertical: AppConstants.hugePadding,
              ),
              child:
                  isMobile
                      ? Wrap(
                        children:
                            controller.folderData.keys.map((folderName) {
                              return FoldersView(
                                controller: controller,
                                folderName: folderName,
                                isMobile: isMobile,
                              );
                            }).toList(),
                      )
                      : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:
                            controller.folderData.keys.map((folderName) {
                              return FoldersView(
                                controller: controller,
                                folderName: folderName,
                              );
                            }).toList(),
                      ),
            ),
            Obx(
              () => Stack(
                children:
                    controller.openFolders.entries.map((entry) {
                      final folderName = entry.key;
                      final position = entry.value;
                      final folderInfo = controller.folderData[folderName]!;
                      return Positioned(
                        top: position.dy,
                        left: position.dx,
                        child: Draggable<Offset>(
                          onDragStarted:
                              () => controller.startDragging(folderName),
                          onDragEnd: (details) {
                            controller.updateFolderPosition(
                              folderName,
                              details.offset,
                            );
                          },
                          feedback: Material(
                            color: Colors.transparent,
                            child: ExperienceContainer(
                              isMobile: isMobile,
                              title: folderInfo["title"],
                              description: folderInfo["description"],
                              skills: List<String>.from(folderInfo["skills"]),
                              date: folderInfo["date"],
                              onClose: () => controller.closeFolder(folderName),
                            ),
                          ),
                          childWhenDragging: Container(),
                          child: Material(
                            color: Colors.transparent,
                            child: ExperienceContainer(
                              isMobile: isMobile,
                              title: folderInfo["title"],
                              description: folderInfo["description"],
                              skills: List<String>.from(folderInfo["skills"]),
                              date: folderInfo["date"],
                              onClose: () => controller.closeFolder(folderName),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}

class FoldersView extends StatelessWidget {
  const FoldersView({
    super.key,
    required this.controller,
    required this.folderName,
    this.isMobile = false,
  });

  final ExperienceController controller;
  final String folderName;
  final bool isMobile;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => controller.openFolder(folderName, isMobile),
      child: SizedBox(
        width: 120,
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => Icon(
                Icons.folder,
                color:
                    controller.openFolders.containsKey(folderName)
                        ? AppColors.teal2
                        : AppColors.teal,
                size: AppConstants.defaultIconSize,
              ),
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
  }
}

class ExperienceContainer extends StatelessWidget {
  final String title;
  final String description;
  final List<String> skills;
  final String date;
  final VoidCallback onClose;
  final bool isMobile;

  const ExperienceContainer({
    super.key,
    required this.title,
    required this.description,
    required this.skills,
    required this.date,
    required this.onClose,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isMobile ? Get.width - 10 : 700,
      height: isMobile ? 500 : 400,
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.largePadding,
        vertical: AppConstants.defaultPadding,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary.withAlpha(200),
        borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
        border: Border.all(
          color: AppColors.stroke,
          width: AppConstants.thickBorderWidth,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.tertiary,
                ),
              ),
              GestureDetector(
                onTap: onClose,
                child: Container(
                  width: AppConstants.mediumIconSize,
                  height: AppConstants.mediumIconSize,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: AppColors.stroke),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.close,
                      color: AppColors.teal,
                      size: AppConstants.smallIconSize,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.defaultBorderRadius),
          Text(
            description,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.secondary,
            ),
          ),
          const SizedBox(height: AppConstants.defaultPadding),
          CustomDivider(width: 700, thickness: 1, isVertical: false),
          const SizedBox(height: AppConstants.defaultPadding),
          ...skills.asMap().entries.map(
            (entry) => Padding(
              padding: const EdgeInsets.only(
                bottom: AppConstants.defaultBorderRadius,
              ),
              child: Text(
                "> ${entry.value}",
                style: AppTextStyles.bodyMedium.copyWith(
                  color: _getSkillColor(entry.value, entry.key),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppConstants.defaultPadding),
          CustomDivider(width: 700, thickness: 1, isVertical: false),
          const SizedBox(height: AppConstants.defaultPadding),
          Text(
            date,
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.tertiary),
          ),
        ],
      ),
    );
  }

  Color _getSkillColor(String skill, int index) {
    switch (index % 4) {
      case 0:
        return AppColors.indigo;
      case 1:
        return AppColors.pink;
      case 2:
        return AppColors.teal;
      case 3:
        return AppColors.stroke2;
      default:
        return AppColors.stroke2;
    }
  }
}
