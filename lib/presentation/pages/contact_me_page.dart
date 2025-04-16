import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/constants/texts.dart';
import 'package:portfolio/core/constants/code.dart';
import 'package:portfolio/presentation/widgets/custom_divider.dart';
import 'package:portfolio/presentation/widgets/files_system.dart';
import 'package:portfolio/presentation/widgets/syntax_highlighter.dart';

class ContactMePage extends StatefulWidget {
  const ContactMePage({super.key});

  @override
  State<ContactMePage> createState() => _ContactMePageState();
}

class _ContactMePageState extends State<ContactMePage> {
  final List<String> openedFiles = ["form"];
  String? selectedFile = "form";

  void openFile(String title) {
    setState(() {
      if (!openedFiles.contains(title)) {
        openedFiles.add(title);
      }
      selectedFile = title;
    });
  }

  void closeFile(String title) {
    setState(() {
      openedFiles.remove(title);
      if (selectedFile == title) {
        selectedFile = openedFiles.isNotEmpty ? openedFiles.last : null;
      }
    });
  }

  void selectFile(String title) {
    setState(() {
      selectedFile = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Files system
        Container(
          width: 311,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.stroke, width: 0.5),
          ),
          child: Column(
            children: [
              ProjectItem(
                title: "contact-info",
                onFileTap: openFile,
                children: [
                  FolderItem(
                    title: "personal",
                    color: AppColors.indigo,
                    onFileTap: openFile,
                    children: [
                      FileItem(title: "email", onTap: () => openFile("email")),
                      FileItem(title: "phone", onTap: () => openFile("phone")),
                    ],
                  ),
                ],
              ),
              CustomDivider(width: 311, isVertical: false, thickness: 0.5),
              ProjectItem(
                title: "contact-form",
                onFileTap: openFile,
                children: [
                  FileItem(title: "form.dart", onTap: () => openFile("form")),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              // Opened files
              SizedBox(
                width: double.infinity,
                height: 56,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...openedFiles.map(
                        (file) => GestureDetector(
                          onTap: () => selectFile(file),
                          child: Container(
                            width: 200,
                            height: 56,
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: AppColors.secondary,
                                  width: 0.5,
                                ),
                              ),
                              color:
                                  selectedFile == file
                                      ? AppColors.primary.withOpacity(0.1)
                                      : null,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  file,
                                  style: AppTextStyles.bodyMedium.copyWith(
                                    color: AppColors.secondary,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => closeFile(file),
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
              CustomDivider(
                width: double.infinity,
                thickness: 0.5,
                isVertical: false,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Code section
                  Expanded(
                    flex: 2,
                    child:
                        selectedFile == "email"
                            ? EmailPage()
                            : selectedFile == "phone"
                            ? PhonePage()
                            : selectedFile == "form"
                            ? FormPage()
                            : SizedBox(),
                  ),
                  CustomDivider(height: 770, thickness: 0.5),
                  // Mobile emulator view
                  Expanded(flex: 1, child: MobileEmulatorView()),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class EmailPage extends StatelessWidget {
  const EmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 770,
      child: SingleChildScrollView(
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
              child: SyntaxHighlighter(code: emailCode),
            ),
          ],
        ),
      ),
    );
  }
}

class PhonePage extends StatelessWidget {
  const PhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 770,
      child: SingleChildScrollView(
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
              child: SyntaxHighlighter(code: phoneCode),
            ),
          ],
        ),
      ),
    );
  }
}

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 770,
      child: SingleChildScrollView(
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
                  100,
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
              child: SyntaxHighlighter(code: formCode),
            ),
          ],
        ),
      ),
    );
  }
}

class MobileEmulatorView extends StatefulWidget {
  const MobileEmulatorView({super.key});

  @override
  State<MobileEmulatorView> createState() => _MobileEmulatorViewState();
}

class _MobileEmulatorViewState extends State<MobileEmulatorView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSending = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _sendEmail() async {}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 770,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Emulator content
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    AppAssets.simulator,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Container(
                  width: 270,
                  height: 550,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16),
                        Text(
                          "Contact Form",
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.indigo,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildFormField(
                          "Name",
                          controller: _nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        _buildFormField(
                          "Email",
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(
                              r'^[^@]+@[^@]+\.[^@]+',
                            ).hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        _buildFormField(
                          "Message",
                          controller: _messageController,
                          maxLines: 4,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your message';
                            }
                            return null;
                          },
                        ),
                        const Spacer(),
                        Center(
                          child: GestureDetector(
                            onTap: _isSending ? null : _sendEmail,
                            child: Container(
                              width: 200,
                              height: 40,
                              decoration: BoxDecoration(
                                color:
                                    _isSending
                                        ? AppColors.indigo.withOpacity(0.7)
                                        : AppColors.indigo,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primary,
                                    offset: Offset(3, 3),
                                  ),
                                ],
                              ),
                              child: Center(
                                child:
                                    _isSending
                                        ? SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            color: AppColors.primary,
                                            strokeWidth: 2,
                                          ),
                                        )
                                        : Text(
                                          "Send Message",
                                          style: AppTextStyles.bodyMedium
                                              .copyWith(
                                                color: AppColors.primary,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormField(
    String label, {
    TextEditingController? controller,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.stroke, width: 0.5),
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        style: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.secondary,
          fontSize: 12,
        ),
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.secondary.withOpacity(0.7),
            fontSize: 12,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(12),
        ),
      ),
    );
  }
}
