import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/constants/texts.dart';

class ContactMeController extends GetxController {
  final RxList<String> openedFiles = <String>["form"].obs;
  final RxString selectedFile = "form".obs;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();
  final isSending = false.obs;

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.onClose();
  }

  void sendEmail() async {
    Get.dialog(
      Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            width: 350,
            height: 200,
            color: AppColors.primary,
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 20,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Seriously?",
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.pink,
                      ),
                    ),
                    InkWell(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.close_rounded,
                        color: AppColors.tertiary,
                      ),
                    ),
                  ],
                ),
                Text(
                  "Do you really think I'm going to waste my time on this?, you got the email right here: seyf.yagoub@gmail.com",
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.tertiary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }

  void openFile(String title) {
    if (!openedFiles.contains(title)) {
      openedFiles.add(title);
    }
    selectedFile.value = title;
  }

  void closeFile(String title) {
    openedFiles.remove(title);
    if (selectedFile.value == title) {
      selectedFile.value = openedFiles.isNotEmpty ? openedFiles.last : "";
    }
  }

  void selectFile(String title) {
    selectedFile.value = title;
  }
}
