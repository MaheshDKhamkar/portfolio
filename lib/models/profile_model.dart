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
    name: 'John Doe',
    title: 'Senior Flutter Developer',
    yearsOfExperience: 3.5,
    bio:
        '''Passionate Flutter developer with 3.5+ years of experience building beautiful, 
high-performance mobile and web applications. Specialized in clean architecture, 
state management, and creating pixel-perfect UIs that users love.

Expertise in Flutter, Dart, Firebase, REST APIs, and modern app development 
practices. Strong advocate for clean code, testing, and continuous learning.''',
    profileImagePath: 'assets/images/profile.png',
    email: 'john.doe@example.com',
    phone: '+1 (555) 123-4567',
    location: 'San Francisco, CA',
    socialLinks: {
      'github': 'https://github.com/johndoe',
      'linkedin': 'https://www.linkedin.com/in/johndoe',
      'twitter': 'https://twitter.com/johndoe',
      'medium': 'https://medium.com/@johndoe',
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
