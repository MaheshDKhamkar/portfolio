/// Project status enumeration
enum ProjectStatus {
  completed,
  inProgress,
  planned;

  String get displayName {
    switch (this) {
      case ProjectStatus.completed:
        return 'Completed';
      case ProjectStatus.inProgress:
        return 'In Progress';
      case ProjectStatus.planned:
        return 'Planned';
    }
  }
}

/// Project model representing portfolio projects
class ProjectModel {
  final String name;
  final String description;
  final List<String> technologies;
  final List<String> screenshots;
  final String? githubUrl;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final String? webUrl;
  final ProjectStatus status;
  final DateTime? completedDate;

  const ProjectModel({
    required this.name,
    required this.description,
    required this.technologies,
    required this.screenshots,
    this.githubUrl,
    this.playStoreUrl,
    this.appStoreUrl,
    this.webUrl,
    required this.status,
    this.completedDate,
  });

  /// Sample projects data
  static List<ProjectModel> get samples => [
    ProjectModel(
      name: 'E-Commerce Mobile App',
      description:
          'A full-featured e-commerce mobile application with user authentication, product catalog, shopping cart, and payment integration. Implemented using clean architecture and BLoC state management.',
      technologies: ['Flutter', 'BLoC', 'Firebase', 'Stripe', 'REST API'],
      screenshots: [
        'assets/images/projects/ecommerce_1.png',
        'assets/images/projects/ecommerce_2.png',
      ],
      githubUrl: 'https://github.com/johndoe/ecommerce-app',
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.example.ecommerce',
      appStoreUrl: 'https://apps.apple.com/app/id123456789',
      status: ProjectStatus.completed,
      completedDate: DateTime(2024, 12, 15),
    ),
    ProjectModel(
      name: 'Fitness Tracking App',
      description:
          'Health and fitness tracking application with workout plans, nutrition tracking, progress analytics, and social features. Features include real-time data sync and offline support.',
      technologies: ['Flutter', 'GetX', 'Hive', 'Charts', 'Firebase'],
      screenshots: [
        'assets/images/projects/fitness_1.png',
        'assets/images/projects/fitness_2.png',
      ],
      githubUrl: 'https://github.com/johndoe/fitness-tracker',
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.example.fitness',
      status: ProjectStatus.completed,
      completedDate: DateTime(2024, 10, 20),
    ),
    ProjectModel(
      name: 'Social Media Dashboard',
      description:
          'A comprehensive social media management dashboard for scheduling posts, analytics, and engagement tracking across multiple platforms. Built with Flutter Web.',
      technologies: [
        'Flutter Web',
        'Riverpod',
        'GraphQL',
        'Node.js',
        'MongoDB',
      ],
      screenshots: [
        'assets/images/projects/dashboard_1.png',
        'assets/images/projects/dashboard_2.png',
      ],
      githubUrl: 'https://github.com/johndoe/social-dashboard',
      webUrl: 'https://social-dashboard.example.com',
      status: ProjectStatus.completed,
      completedDate: DateTime(2024, 8, 5),
    ),
    ProjectModel(
      name: 'Recipe Sharing Platform',
      description:
          'A beautiful recipe sharing platform where users can discover, share, and save recipes. Features include image recognition for ingredients and AI-powered recipe recommendations.',
      technologies: ['Flutter', 'BLoC', 'ML Kit', 'Firebase', 'Algolia'],
      screenshots: [
        'assets/images/projects/recipe_1.png',
        'assets/images/projects/recipe_2.png',
      ],
      githubUrl: 'https://github.com/johndoe/recipe-platform',
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.example.recipe',
      status: ProjectStatus.inProgress,
    ),
    ProjectModel(
      name: 'Task Management System',
      description:
          'Enterprise-level task management system with team collaboration, time tracking, and project planning features. Supports real-time updates and notifications.',
      technologies: [
        'Flutter',
        'Provider',
        'WebSockets',
        'PostgreSQL',
        'Docker',
      ],
      screenshots: [
        'assets/images/projects/task_1.png',
        'assets/images/projects/task_2.png',
      ],
      githubUrl: 'https://github.com/johndoe/task-manager',
      webUrl: 'https://tasks.example.com',
      status: ProjectStatus.completed,
      completedDate: DateTime(2024, 6, 30),
    ),
    ProjectModel(
      name: 'Weather Forecast App',
      description:
          'Beautiful weather application with hourly and weekly forecasts, weather alerts, and location-based recommendations. Features stunning animations and intuitive UI.',
      technologies: ['Flutter', 'BLoC', 'OpenWeatherMap API', 'Geolocator'],
      screenshots: [
        'assets/images/projects/weather_1.png',
        'assets/images/projects/weather_2.png',
      ],
      githubUrl: 'https://github.com/johndoe/weather-app',
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.example.weather',
      appStoreUrl: 'https://apps.apple.com/app/id987654321',
      status: ProjectStatus.completed,
      completedDate: DateTime(2024, 4, 12),
    ),
  ];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'technologies': technologies,
      'screenshots': screenshots,
      'githubUrl': githubUrl,
      'playStoreUrl': playStoreUrl,
      'appStoreUrl': appStoreUrl,
      'webUrl': webUrl,
      'status': status.name,
      'completedDate': completedDate?.toIso8601String(),
    };
  }

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      name: json['name'] as String,
      description: json['description'] as String,
      technologies: List<String>.from(json['technologies'] as List),
      screenshots: List<String>.from(json['screenshots'] as List),
      githubUrl: json['githubUrl'] as String?,
      playStoreUrl: json['playStoreUrl'] as String?,
      appStoreUrl: json['appStoreUrl'] as String?,
      webUrl: json['webUrl'] as String?,
      status: ProjectStatus.values.firstWhere((e) => e.name == json['status']),
      completedDate: json['completedDate'] != null
          ? DateTime.parse(json['completedDate'] as String)
          : null,
    );
  }
}
