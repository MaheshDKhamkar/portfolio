/// Profile model representing developer information
class ProfileModel {
  final String name;
  final String title;
  final double yearsOfExperience;
  final String bio;
  final String profileImagePath;
  final String email;
  final String phone;
  final String location;
  final Map<String, String> socialLinks;

  const ProfileModel({
    required this.name,
    required this.title,
    required this.yearsOfExperience,
    required this.bio,
    required this.profileImagePath,
    required this.email,
    required this.phone,
    required this.location,
    required this.socialLinks,
  });

  /// Sample data for demonstration
  static ProfileModel get sample => ProfileModel(
    name: 'Mahesh Khamkar',
    title: 'Senior Flutter Developer',
    yearsOfExperience: 3.5,
    bio:
        '''Passionate Flutter Developer with 3.5+ years of professional experience in building scalable, high-performance cross-platform applications for Android, iOS, and the Web. Skilled in Flutter, Dart, RESTful APIs, Firebase, and state-management solutions including GetX, Provider, and BLoC.
Experienced in developing production-ready applications from scratch, implementing complex business logic, real-time features, video calling, and multilingual support. Strong foundation in Clean Architecture, performance optimization, and delivering maintainable, user-focused applications published on the Play Store and App Store.''',
    profileImagePath: 'assets/images/profile.png',
    email: 'maheshkhamkar92@gmail.com',
    phone: '+91 8623029055',
    location: 'Jawahar Nagar, Ichalkaranji, Maharashtra, India',
    socialLinks: {
      // 'github': 'https://github.com/johndoe',
      'linkedin': 'https://www.linkedin.com/in/mahesh-khamkar',
      // 'twitter': 'https://twitter.com/johndoe',
      // 'medium': 'https://medium.com/@johndoe',
    },
  );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'title': title,
      'yearsOfExperience': yearsOfExperience,
      'bio': bio,
      'profileImagePath': profileImagePath,
      'email': email,
      'phone': phone,
      'location': location,
      'socialLinks': socialLinks,
    };
  }

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'] as String,
      title: json['title'] as String,
      yearsOfExperience: (json['yearsOfExperience'] as num).toDouble(),
      bio: json['bio'] as String,
      profileImagePath: json['profileImagePath'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      location: json['location'] as String,
      socialLinks: Map<String, String>.from(json['socialLinks'] as Map),
    );
  }
}
