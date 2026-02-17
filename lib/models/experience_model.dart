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

  /// Calculate duration in months (inclusive of both start and end months)
  int get durationInMonths {
    final end = endDate ?? DateTime.now();
    // Add 1 to include both start and end months
    return ((end.year - startDate.year) * 12) +
        (end.month - startDate.month) +
        1;
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

  /// Experience data
  static List<ExperienceModel> get samples => [
    ExperienceModel(
      companyName: 'ReapMind Innovations',
      position: 'Senior Flutter Developer',
      startDate: DateTime(2025, 2, 1),
      endDate: null, // Current position
      location: 'Kolhapur, Maharashtra',
      responsibilities: [
        'Developing and maintaining scalable production-ready Flutter applications',
        'Implementing complex UI flows, REST API integrations, and state management solutions',
        'Collaborating with backend engineers and product teams to deliver new features efficiently',
        'Optimizing application performance and resolving production-level issues',
      ],
      companyLogoPath: 'assets/images/companies/reapmind.png',
    ),
    ExperienceModel(
      companyName: 'Zerovaega Technologies',
      position: 'Flutter Developer',
      startDate: DateTime(2024, 5, 1),
      endDate: DateTime(2025, 2, 28),
      location: 'Kolhapur, Maharashtra',
      responsibilities: [
        'Built and enhanced multiple Flutter applications using clean and maintainable code practices',
        'Integrated RESTful APIs and implemented secure authentication flows',
        'Developed custom UI components and animations as per design requirements',
        'Fixed critical production bugs and improved overall user experience',
      ],
      companyLogoPath: 'assets/images/companies/zerovaega.png',
    ),
    ExperienceModel(
      companyName: 'ReapMind Innovations',
      position: 'Junior Flutter Developer',
      startDate: DateTime(2022, 9, 1),
      endDate: DateTime(2024, 4, 30),
      location: 'Kolhapur, Maharashtra',
      responsibilities: [
        'Developed Flutter applications from scratch and contributed to core application modules',
        'Worked extensively on REST API integration, UI development, and local data storage',
        'Collaborated closely with QA and design teams to ensure smooth releases',
      ],
      companyLogoPath: 'assets/images/companies/reapmind.png',
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
