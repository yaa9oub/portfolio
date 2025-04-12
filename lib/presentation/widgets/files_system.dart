import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/constants/texts.dart';

class ProjectItem extends StatefulWidget {
  final String title;
  final List<Widget> children;
  final Function(String)? onFileTap;

  const ProjectItem({
    required this.title,
    required this.children,
    this.onFileTap,
    super.key,
  });

  @override
  _ProjectItemState createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => setState(() => isExpanded = !isExpanded),
          child: Container(
            width: 311,
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: [
                Icon(
                  isExpanded
                      ? Icons.arrow_drop_down_rounded
                      : Icons.arrow_right_rounded,
                  color: AppColors.tertiary,
                ),
                SizedBox(width: 8),
                Text(
                  widget.title,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.tertiary,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isExpanded) ...widget.children,
      ],
    );
  }
}

class FolderItem extends StatefulWidget {
  final String title;
  final List<Widget> children;
  final Color color;
  final Function(String)? onFileTap;

  const FolderItem({
    required this.title,
    required this.children,
    this.color = AppColors.indigo,
    this.onFileTap,
    super.key,
  });

  @override
  _FolderItemState createState() => _FolderItemState();
}

class _FolderItemState extends State<FolderItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => setState(() => isExpanded = !isExpanded),
          child: Container(
            width: 311,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Row(
              children: [
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_right,
                  color: AppColors.secondary,
                  size: 16,
                ),
                SizedBox(width: 8),
                Icon(Icons.folder, color: widget.color, size: 16),
                SizedBox(width: 8),
                Text(
                  widget.title,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isExpanded) ...widget.children,
      ],
    );
  }
}

class FileItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  const FileItem({
    required this.title,
    this.icon = Icons.file_copy_outlined,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 311,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Row(
          children: [
            SizedBox(width: 26),
            Icon(icon, color: AppColors.secondary, size: 16),
            SizedBox(width: 8),
            Text(
              title,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.secondary,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
