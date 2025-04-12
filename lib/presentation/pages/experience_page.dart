import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/constants/texts.dart';
import 'package:portfolio/presentation/widgets/custom_divider.dart';

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({super.key});

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  final Map<String, Offset> openFolders = {};
  final Map<String, bool> isDragging = {};
  final Map<String, Map<String, dynamic>> folderData = {
    "Profiler": {
      "title": "Profiler LLC - Profiler App",
      "description":
          "A cross-platform mobile app that provides users who are interested in building their online profiles using AI models and user's interactions to generate a very constructive feedback.",
      "skills": [
        "Flutter, Dart",
        "Git, GitHub",
        "Figma",
        "Postman, Linear, Notion, Cursor, Slack",
        "Getx, MVVM.",
      ],
      "date": "April 2024 - Present",
    },
    "Upwork": {
      "title": "Upwork - Our Convo App",
      "description":
          "A cross-platform mobile app for friends, family, and colleagues to stay connected, answer questions, and share memories.",
      "skills": [
        "Flutter, Dart",
        "Git, GitHub",
        "Figma",
        "Firebase authentication, Firestore, Firebase storage, Firebase functions.",
        "Bloc, Clean Architecture.",
      ],
      "date": "July 2024 - December 2024",
    },
    "Nachd IT": {
      "title": "Nachd IT - WeeFarm App",
      "description":
          "A marketplace for farmers to upload, sell and buy different products. Consumer can connect with the farmers and buy the products directly from them.",
      "skills": [
        "Flutter, Dart",
        "Git, GitHub",
        "Adobe XD",
        "Postman, Jira",
        "Getx, MVVM",
      ],
      "date": "July 2023 - April 2024",
    },
    "Gwala Co": {
      "title": "Gwala Co - Gwala App",
      "description":
          "Provides early access to salary and other benefits of employees in Morocco.",
      "skills": [
        "Flutter, Dart",
        "Git, GitHub",
        "Figma",
        "Swagger, Jira",
        "Getx, MVC",
      ],
      "date": "June 2022 - July 2023",
    },
    "Ticka World": {
      "title": "Ticka World",
      "description":
          "A platform that provides designing tools on different product mockups for designers. An easy to access shops for customers to buy personalized products.",
      "skills": ["React, typescript", "Git, GitHub", "Cursor"],
      "date": "",
    },
  };

  void _openFolder(String folderName) {
    setState(() {
      if (!openFolders.containsKey(folderName)) {
        // Position new folders in a cascading pattern
        openFolders[folderName] = Offset(
          400 + (openFolders.length * 30),
          200 + (openFolders.length * 30),
        );
        isDragging[folderName] = false;
      }
    });
  }

  void _closeFolder(String folderName) {
    setState(() {
      openFolders.remove(folderName);
      isDragging.remove(folderName);
    });
  }

  void _updateFolderPosition(String folderName, Offset newPosition) {
    setState(() {
      var position = Offset(newPosition.dx, newPosition.dy - 56);
      openFolders[folderName] = position;
      isDragging[folderName] = false;
    });
  }

  void _startDragging(String folderName) {
    setState(() {
      isDragging[folderName] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  color: AppColors.indigo,
                  blurRadius: 200,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: Get.width,
          height: Get.height,
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children:
                folderData.keys.map((folderName) {
                  return GestureDetector(
                    onDoubleTap: () => _openFolder(folderName),
                    child: SizedBox(
                      width: 120,
                      height: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.folder,
                            color:
                                openFolders.containsKey(folderName)
                                    ? AppColors.teal2
                                    : AppColors.teal,
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
        ...openFolders.entries.map((entry) {
          final folderName = entry.key;
          final position = entry.value;
          return Positioned(
            top: position.dy,
            left: position.dx,
            child: Draggable<Offset>(
              onDragStarted: () => _startDragging(folderName),
              onDragEnd: (details) {
                _updateFolderPosition(folderName, details.offset);
              },
              feedback: Material(
                color: Colors.transparent,
                child: ExperienceContainer(
                  title: folderData[folderName]!["title"],
                  description: folderData[folderName]!["description"],
                  skills: List<String>.from(folderData[folderName]!["skills"]),
                  date: folderData[folderName]!["date"],
                  onClose: () => _closeFolder(folderName),
                ),
              ),
              childWhenDragging: Container(),
              child: Material(
                color: Colors.transparent,
                child: ExperienceContainer(
                  title: folderData[folderName]!["title"],
                  description: folderData[folderName]!["description"],
                  skills: List<String>.from(folderData[folderName]!["skills"]),
                  date: folderData[folderName]!["date"],
                  onClose: () => _closeFolder(folderName),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}

class ExperienceContainer extends StatelessWidget {
  final String title;
  final String description;
  final List<String> skills;
  final String date;
  final VoidCallback onClose;

  const ExperienceContainer({
    super.key,
    required this.title,
    required this.description,
    required this.skills,
    required this.date,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 700,
      height: 400,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.primary.withAlpha(200),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.stroke, width: 2),
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
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: AppColors.stroke),
                  ),
                  child: const Center(
                    child: Icon(Icons.close, color: AppColors.teal),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.secondary,
            ),
          ),
          const SizedBox(height: 16),
          CustomDivider(width: 700, thickness: 1, isVertical: false),
          const SizedBox(height: 16),
          ...skills.asMap().entries.map(
            (entry) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                "> ${entry.value}",
                style: AppTextStyles.bodyMedium.copyWith(
                  color: _getSkillColor(entry.value, entry.key),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          CustomDivider(width: 700, thickness: 1, isVertical: false),
          const SizedBox(height: 16),
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



// ExperienceContainer(
//                   title: "Profiler LLC - Profiler App",
//                   description:
//                       "A cross-platform mobile app that provides users who are interested in building their online profiles using AI models and user's interactions to generate a very constructive feedback.",
//                   skills: [
//                     "Flutter, Dart",
//                     "Git, GitHub",
//                     "Figma",
//                     "Postman, Linear, Notion, Cursor, Slack",
//                     "Getx, MVVM.",
//                   ],
//                   date: "April 2024 - Present",
//                 ),
//                 ExperienceContainer(
//                   title: "Upwork - Our Convo App",
//                   description:
//                       "A cross-platform mobile app for friends, family, and colleagues to stay connected, answer questions, and share memories.",
//                   skills: [
//                     "Flutter, Dart",
//                     "Git, GitHub",
//                     "Figma",
//                     "Firebase authentication, Firestore, Firebase storage, Firebase functions.",
//                     "Bloc, Clean Architecture.",
//                   ],
//                   date: "July 2024 - December 2024",
//                 ),
//                 ExperienceContainer(
//                   title: "Nachd IT - WeeFarm App",
//                   description:
//                       "A marketplace for farmers to upload, sell and buy different products. Consumer can connect with the farmers and buy the products directly from them.",
//                   skills: [
//                     "Flutter, Dart",
//                     "Git, GitHub",
//                     "Adobe XD",
//                     "Postman, Jira",
//                     "Getx, MVVM",
//                   ],
//                   date: "July 2023 - April 2024",
//                 ),
//                 ExperienceContainer(
//                   title: "Gwala Co - Gwala App",
//                   description:
//                       "Provides early access to salary and other benefits of employees in Morocco.",
//                   skills: [
//                     "Flutter, Dart",
//                     "Git, GitHub",
//                     "Figma",
//                     "Swagger, Jira",
//                     "Getx, MVC",
//                   ],
//                   date: "June 2022 - July 2023",
//                 ),
//                 ExperienceContainer(
//                   title: "Ticka World",
//                   description:
//                       "A platform that provides designing tools on different product mockups for designers. An easy to access shops for customers to buy personalized products.",
//                   skills: ["React, typescript", "Git, GitHub", "Cursor"],
//                   date: "",
//                 ),