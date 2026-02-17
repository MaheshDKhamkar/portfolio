/// Work experience model
class ExperienceModel {
  final String companyName;
  final String position;
  final DateTime startDate;
  final DateTime? endDate; // null if current position
  final String location;
  final List<String> responsibilities;
  final String? companyLogoPath;

  const ExperienceModel({
    required this.companyName,
    required this.position,
    required this.startDate,
    this.endDate,
    required this.location,
    required this.responsibilities,
    this.companyLogoPath,
  });

  /// Check if this is current position
  bool get isCurrent => endDate == null;

  /// Duration string (e.g., "Jan 2022 - Present" or "Jan 2022 - Dec 2023")
  String get durationString {
    final start = _formatDate(startDate);
    final end = endDate != null ? _formatDate(endDate!) : 'Present';
    return '$start - $end';
  }

  /// Calculate duration in months
  int get durationInMonths {
    final end = endDate ?? DateTime.now();
    return ((end.year - startDate.year) * 12) + (end.month - startDate.month);
  }

  /// Duration display string (e.g., "2 years 3 months")
  String get durationDisplay {
    final months = durationInMonths;
    final years = months ~/ 12;
    final remainingMonths = months % 12;

    if (years > 0 && remainingMonths > 0) {
      return '$years ${years == 1 ? 'year' : 'years'} $remainingMonths ${remainingMonths == 1 ? 'month' : 'months'}';
    } else if (years > 0) {
      return '$years ${years == 1 ? 'year' : 'years'}';
    } else {
      return '$remainingMonths ${remainingMonths == 1 ? 'month' : 'months'}';
    }
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.year}';
  }

  /// Sample experience data
  static List<ExperienceModel> get samples => [
    ExperienceModel(
      companyName: 'TechCorp Solutions',
      position: 'Senior Flutter Developer',
      startDate: DateTime(2023, 6, 1),
      endDate: null, // Current position
      location: 'San Francisco, CA',
      responsibilities: [
        'Led a team of 4 developers in building cross-platform mobile applications',
        'Architected and implemented scalable Flutter apps using clean architecture and BLoC',
        'Reduced app startup time by 40% through performance optimizations',
        'Mentored junior developers and conducted code reviews',
        'Integrated CI/CD pipelines with automated testing and deployment',
      ],
      companyLogoPath: 'assets/images/companies/techcorp.png',
    ),
    ExperienceModel(
      companyName: 'InnovateTech Inc.',
      position: 'Flutter Developer',
      startDate: DateTime(2022, 1, 15),
      endDate: DateTime(2023, 5, 31),
      location: 'Remote',
      responsibilities: [
        'Developed and maintained 3 production Flutter applications',
        'Implemented state management using BLoC and Provider patterns',
        'Integrated Firebase services including Authentication, Firestore, and Cloud Functions',
        'Collaborated with designers to create pixel-perfect, responsive UIs',
        'Achieved 98% crash-free rate across all deployed applications',
      ],
      companyLogoPath: 'assets/images/companies/innovatetech.png',
    ),
    ExperienceModel(
      companyName: 'StartupHub',
      position: 'Junior Flutter Developer',
      startDate: DateTime(2021, 7, 1),
      endDate: DateTime(2022, 1, 10),
      location: 'New York, NY',
      responsibilities: [
        'Built features for a social networking mobile application',
        'Worked on REST API integration and data persistence',
        'Implemented responsive UI designs for multiple screen sizes',
        'Fixed bugs and improved app performance',
        'Participated in agile development with 2-week sprints',
      ],
      companyLogoPath: 'assets/images/companies/startuphub.png',
    ),
    ExperienceModel(
      companyName: 'CodeCraft Solutions (Internship)',
      position: 'Mobile Development Intern',
      startDate: DateTime(2021, 1, 1),
      endDate: DateTime(2021, 6, 30),
      location: 'Boston, MA',
      responsibilities: [
        'Learned Flutter framework and Dart programming language',
        'Contributed to internal tools and proof-of-concept applications',
        'Assisted senior developers with testing and debugging',
        'Participated in code reviews and team meetings',
      ],
      companyLogoPath: 'assets/images/companies/codecraft.png',
    ),
  ];

  Map<String, dynamic> toJson() {
    return {
      'companyName': companyName,
      'position': position,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'location': location,
      'responsibilities': responsibilities,
      'companyLogoPath': companyLogoPath,
    };
  }

  factory ExperienceModel.fromJson(Map<String, dynamic> json) {
    return ExperienceModel(
      companyName: json['companyName'] as String,
      position: json['position'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] != null
          ? DateTime.parse(json['endDate'] as String)
          : null,
      location: json['location'] as String,
      responsibilities: List<String>.from(json['responsibilities'] as List),
      companyLogoPath: json['companyLogoPath'] as String?,
    );
  }
}
