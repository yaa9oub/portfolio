import 'package:flutter/material.dart';

enum FileSystemItemType { project, folder, file }

class FileSystemItem {
  final String name;
  final FileSystemItemType type;
  final IconData icon;
  final Color iconColor;
  final List<FileSystemItem> children;
  bool isExpanded;

  FileSystemItem({
    required this.name,
    required this.type,
    required this.icon,
    required this.iconColor,
    this.children = const [],
    this.isExpanded = false,
  });
}
