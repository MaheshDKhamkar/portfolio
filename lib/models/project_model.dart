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

  /// Projects data
  static List<ProjectModel> get samples => [
    ProjectModel(
      name: 'MulkMed – Telemedicine Mobile Application',
      description:
          'Comprehensive telemedicine solution with two applications:\n\n'
          'Patient App: Appointment booking, video consultations with real-time chat, digital wallet, prescriptions, AI health tracking, multi-language support (RTL), and Traveler Mode.\n\n'
          'Doctor App: Appointment management, patient records, video consultations, status workflows, and real-time notifications.\n\n'
          'Delivered a scalable end-to-end telemedicine solution for seamless doctor–patient interaction.',
      technologies: [
        'Flutter',
        'GetX',
        'REST API',
        'Video Calling',
        'Real-time Chat',
        'Firebase',
        'Multi-language Support',
        'Digital Wallet',
      ],
      screenshots: [
        'assets/images/mulkmed patient.png',
        'assets/images/patient.png',
      ],
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.mulkeHealth.patienteHealth&pcampaignid=web_share',
      status: ProjectStatus.inProgress,
    ),
    ProjectModel(
      name: 'Watch Your Health (Web Admin Panel)',
      description:
          'Developed Flutter Web admin panel to manage 5K+ users and health data. Integrated dashboards, analytics, and OTP authentication for secure access. Built responsive layouts with bulk-data upload and API-driven reporting, reducing manual work by 25%.',
      technologies: [
        'Flutter Web',
        'REST API',
        'OTP Authentication',
        'Dashboards',
        'Analytics',
        'Responsive Design',
      ],
      screenshots: [
        // 'assets/images/projects/health_admin_1.png',
        // 'assets/images/projects/health_admin_2.png',
      ],
      // webUrl: '',
      status: ProjectStatus.completed,
    ),
    ProjectModel(
      name: 'Dating Application',
      description:
          'Built complete Flutter UI with reusable widgets following Material Design principles. Integrated REST APIs for real-time profiles, chats, and notifications. Used GetX for efficient state management, ensuring high performance and maintainability.',
      technologies: [
        'Flutter',
        'GetX',
        'REST API',
        'Real-time Chat',
        'Notifications',
        'Material Design',
      ],
      screenshots: [
        'assets/images/projects/dating_1.png',
        'assets/images/projects/dating_2.png',
      ],
      status: ProjectStatus.completed,
    ),
    ProjectModel(
      name: 'Pawspace (Pet Care Services App)',
      description:
          'Redesigned Flutter UI/UX, improving booking completion rate by 20%. Integrated REST APIs for scheduling, payments, and user management. Enhanced accessibility and app flow for a seamless user experience.',
      technologies: [
        'Flutter',
        'REST API',
        'Payment Integration',
        'Scheduling',
        'Material Design',
      ],
      screenshots: [
        'assets/images/projects/pawspace_1.png',
        'assets/images/projects/pawspace_2.png',
      ],
      playStoreUrl:
          "https://play.google.com/store/apps/details?id=com.app.pawspace&pcampaignid=web_share ",
      status: ProjectStatus.completed,
    ),
    ProjectModel(
      name: 'The Organic World (E-Commerce App)',
      description:
          'Built marketplace for 1.5K+ organic products with advanced product filters. Implemented cart, checkout, and order-tracking modules using Provider for scalable state management. Optimized widget rebuilds and lazy loading, improving UI rendering time by 30%.',
      technologies: [
        'Flutter',
        'Provider',
        'REST API',
        'Payment Integration',
        'Order Tracking',
      ],
      screenshots: [
        'assets/images/projects/organic_world_1.png',
        'assets/images/projects/organic_world_2.png',
      ],
      playStoreUrl:
          "https://play.google.com/store/apps/details?id=com.tow.b2c&pcampaignid=web_share",
      status: ProjectStatus.completed,
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
