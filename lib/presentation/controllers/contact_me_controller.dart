import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    // TODO: Implement email sending logic
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
