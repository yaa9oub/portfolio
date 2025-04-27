import 'package:portfolio/core/constants/assets.dart';

class AppData {
  static final Map<String, Map<String, dynamic>> projectsData = {
    "Profiler": {"screenshots": []},
    "Kojo": {"screenshots": []},
    "WeeFarm": {"screenshots": []},
    "Protec": {"screenshots": []},
    "Fas3a": {"screenshots": []},
    "Deeds": {
      "icon": AppAssets.deeds,
      "screenshots": [
        AppAssets.deeds1,
        AppAssets.deeds2,
        AppAssets.deeds3,
        AppAssets.deeds4,
        AppAssets.deeds5,
        AppAssets.deeds6,
        AppAssets.deeds7,
        AppAssets.deeds9,
        AppAssets.deeds8,
      ],
    },
    "Stouchi": {"screenshots": []},
    "Gwala": {"screenshots": []},
    "Midibi": {"screenshots": []},
    "Ticka": {"screenshots": []},
    "Convo": {"screenshots": []},
  };

  // TODO: Add experienceData (from ExperienceController)
  // TODO: Add aboutMeData (from about_me_page.dart)
  // TODO: Add contactFormData (from contact_me_page.dart)

  // --- Strings ---
  static const String noScreenshotsTitle = "NO SCREENSHOTS YET";
  static const String noScreenshotsMessage =
      "This project is still under development. I will update this section as soon as I can.";
  static const String noScreenshotsGifUrl =
      "https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExd3FoaGVkOXBieml5YWhpZTEwc3AydHByMWkydmZnbXhtdnVmcjlpNyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/3V5xCr3DvoJxRF0HNb/giphy.gif";

  // --- Hello Page ---
  static const String helloGreeting = "Hello y'all. I am";
  static const String helloName = "Seyf Yacoub";
  static const String helloRole1 = "> Software Engineer";
  static const String helloRole2 = "> Mobile Developer";
  static const String helloRole3 = "> Flutter Enthusiast";
  static const String helloToolsComment = "// tools I use daily";

  // --- Contact Me Page ---
  static const String contactFormTitle = "Contact Form";
  static const String contactNameLabel = "Name";
  static const String contactNameValidation = "Please enter your name";
  static const String contactEmailLabel = "Email";
  static const String contactEmailEmptyValidation = "Please enter your email";
  static const String contactEmailInvalidValidation =
      "Please enter a valid email";
  static const String contactMessageLabel = "Message";
  static const String contactMessageValidation = "Please enter your message";
  static const String contactSendButton = "Send Message";
  static final RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');

  static const String contactInfoSectionTitle = "contact-info";
  static const String personalFolderTitle = "personal";
  static const String emailFileTitle = "email";
  static const String phoneFileTitle = "phone";
  static const String contactFormSectionTitle = "contact-form";
  static const String formFileTitle =
      "form.dart"; // Or just "form"? Used as key. Let's keep "form" for keys
  static const String formFileDisplayTitle = "form.dart";

  // --- About Me Page ---
  static const String aboutMeSectionTitle = "about-me";
  static const String personalInfoFolderTitle = "personal-info";
  static const String bioFileTitle = "bio";
  static const String interestsFileTitle = "interests";
  static const String educationFolderTitle = "education";
  static const String highSchoolFileTitle = "high-school";
  static const String universityFileTitle = "university";
  static const String scholarshipsFileTitle = "scholarships";
  static const String clubsFileTitle = "clubs";
  static const String contactsSectionTitle = "contacts";
  static const String emailContact = "seyf.yagoub@gmail.com";
  static const String phoneContact = "(+216) 99 101 001";
  static const String bioComment = """
/*
About me,
I wrote my first line of code in 2016,
it was a simple Hello World print using python,
now I have helped countless clients launch their mobile applications.

I tried different languages and frameworks along the way 
but Flutter felt very special to me and since 2019 I never stopped bringing ideas to life with it.

I'm not a typical developer who only knows how to code WOOOW applications.

What I got is curiosity, very much of it.
Eager to prove myself and to prove you wrong.
Team player but also I got leader instincts.
Challenger, so challenge me as much as you can, if it's a good one I will not sleep until I either finish the challenge or die.

this bio is just for fun, don't take it too serious.
*/
""";
  static const String bioPhotoUrl = "'assets/images/seyf.png'";
  static const String bioFirstName = "'Seyf'";
  static const String bioLastName = 'Yacoub';
  static const String bioAge = '25';
  static const String bioNationality = "'Tunisian'";
}
