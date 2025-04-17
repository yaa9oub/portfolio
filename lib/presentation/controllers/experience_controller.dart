import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExperienceController extends GetxController {
  final RxMap<String, Offset> openFolders = <String, Offset>{}.obs;
  final RxMap<String, bool> isDragging = <String, bool>{}.obs;
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

  void openFolder(String folderName, bool isMobile) {
    if (!openFolders.containsKey(folderName)) {
      openFolders[folderName] = Offset(
        isMobile ? 10 : 400 + (openFolders.length * 30),
        isMobile ? 200 : 200 + (openFolders.length * 30),
      );
      isDragging[folderName] = false;
    }
  }

  void closeFolder(String folderName) {
    openFolders.remove(folderName);
    isDragging.remove(folderName);
  }

  void updateFolderPosition(String folderName, Offset newPosition) {
    var position = Offset(newPosition.dx, newPosition.dy - 56);
    openFolders[folderName] = position;
    isDragging[folderName] = false;
  }

  void startDragging(String folderName) {
    isDragging[folderName] = true;
  }
}
