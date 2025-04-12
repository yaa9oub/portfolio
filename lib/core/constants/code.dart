const String interestsCode = '''
void main() {
  // List of interests 
  List<String> interests = [
    "Flutter Development",
    "Teaching",
    "Hackathons",
    "Startups",
    "Entrepreneurship",
    "Virtual Reality",
    "Content Creation",
    "AI Tools",
    "Playing Guitar", 
    "Swimming",
    "Camping"
  ];

  // Print the filtered interests
  printInterests(filteredInterests);
}

// Method to print all interests in a formatted way
void printInterests(List<String> filteredInterests) {
  for (var interest in filteredInterests) {
    print("Interest: interest");
  }
}
''';

const String highSchoolCode = '''
class HighSchool {
  final String name;
  final String specialty;
  final String location;
  final String year;

  HighSchool({
    required this.name,
    required this.specialty,
    required this.location,
    required this.year,
  });
}

void main() {
  HighSchool highSchool = HighSchool(
    name: "Abouloubeba High School",
    specialty: "Computer Science",
    location: "Gabes, Tunisia",
    year: "2018",
  );

  print("High School: " + highSchool.name);
  print("Specialty: " + highSchool.specialty);
  print("Location: " + highSchool.location);
  print("Year: " + highSchool.year);
}
''';

const String universityCode = '''
class University {
  final String name;
  final String specialty;
  final String location;
  final String year;

  University({
    required this.name,
    required this.specialty,
    required this.location,
    required this.year,
  });
}

void main() {
  University university_preparatory_classes = University(
    name: "Higher Institute of Applied Sciences and Technology, Sousse",
    specialty: "Preparatory Classes for Engineering Schools",
    location: "Sousse, Tunisia",
    year: "2018-2020",
  );

  University university_engineering_schools = University(
    name: "Higher Institute of Applied Sciences and Technology, Sousse",
    specialty: "Software Engineering",
    location: "Sousse, Tunisia",
    year: "2020-2023",
  );
}
''';

const String scholarships = '''
class Scholarship {
  final String name;
  final List<String> courses;
  final String year;
  final String university;
  final String location;

  Scholarship({
    required this.name,
    required this.courses,
    required this.year,
    required this.university,
    required this.location,
  });
}

void main() {
  Scholarship scholarship = Scholarship(
    name: "Thomas Jefferson Scholarship Program",
    courses: [
    "Web Development", 
    "Mobile Development", 
    "3D Printing", 
    "Unity Development for VR/AR", 
    "UI/UX Design",
    "Pitch Deck",
    "Business Plan",
    ],
    year: "2021",
    university: "Kirkwood Community College",
    location: "Cedar Rapids, Iowa, USA",
  );
}
''';

const String clubs = '''
class Club {
  final String name;
  final String position;
  final String description;
  final List<String> skills;
  final String year;

  Club({
    required this.name,
    required this.position,
    required this.description,
    required this.skills,
    required this.year,
  });
}

void main() {
  Club club1 = Club(
    name: "Google Developer Student Club",
    position: "Marketing Member",
    description: "Editing and publishing content on social media platforms",
    skills: ["Video editing", "Graphic design", "Social Media management"],
    year: "2019-2020",
  );

  Club club2 = Club(
    name: "Google Developer Student Club",
    position: "Marketing Team Leader",
    description: "Leading the marketing team and organizing social media campaigns",
    skills: ["Video editing", "Graphic design", "Social Media management", "Event organization"],
    year: "2020-2021",
  );
}
''';

const String emailCode = '''
class Email {
  final String address;
  final String type;
  final bool isPrimary;

  Email({
    required this.address,
    required this.type,
    required this.isPrimary,
  });
}

void main() {
  Email email = Email(
    address: "seyf.yagoub@gmail.com",
    type: "Personal",
    isPrimary: true,
  );

  print("Email: " + email.address);
  print("Type: " + email.type);
  print("Primary: " + email.isPrimary.toString());
}
''';

const String phoneCode = '''
class Phone {
  final String number;
  final String countryCode;
  final String type;
  final bool isPrimary;

  Phone({
    required this.number,
    required this.countryCode,
    required this.type,
    required this.isPrimary,
  });
}

void main() {
  Phone phone = Phone(
    number: "99 101 001",
    countryCode: "+216",
    type: "Mobile",
    isPrimary: true,
  );

  print("Phone: " + phone.countryCode + " " + phone.number);
  print("Type: " + phone.type);
  print("Primary: " + phone.isPrimary.toString());
}
''';

const String githubCode = '''
class SocialMedia {
  final String platform;
  final String username;
  final String url;
  final String icon;

  SocialMedia({
    required this.platform,
    required this.username,
    required this.url,
    required this.icon,
  });
}

void main() {
  SocialMedia github = SocialMedia(
    platform: "GitHub",
    username: "seyfyacoub",
    url: "https://github.com/seyfyacoub",
    icon: "assets/icons/github.png",
  );

  print("Platform: " + github.platform);
  print("Username: " + github.username);
  print("URL: " + github.url);
}
''';

const String linkedinCode = '''
class SocialMedia {
  final String platform;
  final String username;
  final String url;
  final String icon;

  SocialMedia({
    required this.platform,
    required this.username,
    required this.url,
    required this.icon,
  });
}

void main() {
  SocialMedia linkedin = SocialMedia(
    platform: "LinkedIn",
    username: "seyfyacoub",
    url: "https://linkedin.com/in/seyfyacoub",
    icon: "assets/icons/linkedin.png",
  );

  print("Platform: " + linkedin.platform);
  print("Username: " + linkedin.username);
  print("URL: " + linkedin.url);
}
''';

const String twitterCode = '''
class SocialMedia {
  final String platform;
  final String username;
  final String url;
  final String icon;

  SocialMedia({
    required this.platform,
    required this.username,
    required this.url,
    required this.icon,
  });
}

void main() {
  SocialMedia twitter = SocialMedia(
    platform: "Twitter",
    username: "seyfyacoub",
    url: "https://twitter.com/seyfyacoub",
    icon: "assets/icons/twitter.png",
  );

  print("Platform: " + twitter.platform);
  print("Username: " + twitter.username);
  print("URL: " + twitter.url);
}
''';

const String formCode = '''
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process form data
      print("Name: " + _nameController.text);
      print("Email: " + _emailController.text);
      print("Message: " + _messageController.text);
      
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Message sent successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _messageController,
            decoration: const InputDecoration(
              labelText: 'Message',
              border: OutlineInputBorder(),
            ),
            maxLines: 4,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your message';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _submitForm,
            child: const Text('Send Message'),
          ),
        ],
      ),
    );
  }
}
''';

const String dailyToolsCode = '''
List<String> tools = ["Flutter","Dart","Git","GitHub","VSCode","Android Studio","Xcode","Figma","Postman","Cursor","Linear","Slack","Notion"];
''';
