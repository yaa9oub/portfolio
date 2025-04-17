import 'package:get/get.dart';

class AboutMeController extends GetxController {
  final RxList<String> openedFiles = <String>[].obs;
  final RxString selectedFile = 'clubs'.obs;

  void openFile(String title) {
    if (!openedFiles.contains(title)) {
      openedFiles.add(title);
    }
    selectedFile.value = title;
  }

  void closeFile(String title) {
    openedFiles.remove(title);
    if (selectedFile.value == title) {
      selectedFile.value = openedFiles.isNotEmpty ? openedFiles.last : '';
    }
  }

  void selectFile(String title) {
    selectedFile.value = title;
  }
}
