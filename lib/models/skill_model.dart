import 'package:flutter/material.dart';

/// Skill category enumeration
enum SkillCategory {
  languages,
  frameworks,
  tools,
  design,
  other;

  String get displayName {
    switch (this) {
      case SkillCategory.languages:
        return 'Languages';
      case SkillCategory.frameworks:
        return 'Frameworks & Libraries';
      case SkillCategory.tools:
        return 'Tools & Technologies';
      case SkillCategory.design:
        return 'Design & UI/UX';
      case SkillCategory.other:
        return 'Other Skills';
    }
  }
}

/// Skill model representing developer skills
class SkillModel {
  final String name;
  final double proficiency; // 0.0 to 1.0 (0% to 100%)
  final SkillCategory category;
  final IconData icon;

  const SkillModel({
    required this.name,
    required this.proficiency,
    required this.category,
    required this.icon,
  });

  /// Proficiency percentage (0 to 100)
  int get proficiencyPercentage => (proficiency * 100).round();

  /// Skills data
  static List<SkillModel> get samples => [
    // Programming Languages
    const SkillModel(
      name: 'Dart',
      proficiency: 0.95,
      category: SkillCategory.languages,
      icon: Icons.code,
    ),
    const SkillModel(
      name: 'Java',
      proficiency: 0.85,
      category: SkillCategory.languages,
      icon: Icons.code,
    ),
    const SkillModel(
      name: 'HTML',
      proficiency: 0.90,
      category: SkillCategory.languages,
      icon: Icons.html,
    ),
    const SkillModel(
      name: 'CSS',
      proficiency: 0.88,
      category: SkillCategory.languages,
      icon: Icons.css,
    ),

    // Frameworks & Libraries
    const SkillModel(
      name: 'Flutter',
      proficiency: 0.95,
      category: SkillCategory.frameworks,
      icon: Icons.flutter_dash,
    ),
    const SkillModel(
      name: 'Firebase',
      proficiency: 0.90,
      category: SkillCategory.frameworks,
      icon: Icons.cloud,
    ),
    const SkillModel(
      name: 'RESTful APIs',
      proficiency: 0.92,
      category: SkillCategory.frameworks,
      icon: Icons.api,
    ),
    const SkillModel(
      name: 'Google Maps API',
      proficiency: 0.85,
      category: SkillCategory.frameworks,
      icon: Icons.map,
    ),
    const SkillModel(
      name: 'Razorpay SDK',
      proficiency: 0.80,
      category: SkillCategory.frameworks,
      icon: Icons.payment,
    ),
    const SkillModel(
      name: 'JSON',
      proficiency: 0.95,
      category: SkillCategory.frameworks,
      icon: Icons.data_object,
    ),
    const SkillModel(
      name: 'XML',
      proficiency: 0.85,
      category: SkillCategory.frameworks,
      icon: Icons.description,
    ),
    const SkillModel(
      name: 'GetX',
      proficiency: 0.90,
      category: SkillCategory.frameworks,
      icon: Icons.settings_input_component,
    ),
    const SkillModel(
      name: 'Provider',
      proficiency: 0.88,
      category: SkillCategory.frameworks,
      icon: Icons.settings_input_component,
    ),
    const SkillModel(
      name: 'BLoC',
      proficiency: 0.90,
      category: SkillCategory.frameworks,
      icon: Icons.architecture,
    ),

    // Development Tools & Technologies
    const SkillModel(
      name: 'Android Studio',
      proficiency: 0.92,
      category: SkillCategory.tools,
      icon: Icons.android,
    ),
    const SkillModel(
      name: 'Xcode',
      proficiency: 0.85,
      category: SkillCategory.tools,
      icon: Icons.apple,
    ),
    const SkillModel(
      name: 'Visual Studio Code',
      proficiency: 0.95,
      category: SkillCategory.tools,
      icon: Icons.code,
    ),
    const SkillModel(
      name: 'Git',
      proficiency: 0.92,
      category: SkillCategory.tools,
      icon: Icons.source,
    ),
    const SkillModel(
      name: 'GitHub',
      proficiency: 0.90,
      category: SkillCategory.tools,
      icon: Icons.source,
    ),
    const SkillModel(
      name: 'Bitbucket',
      proficiency: 0.85,
      category: SkillCategory.tools,
      icon: Icons.source,
    ),
    const SkillModel(
      name: 'JIRA',
      proficiency: 0.85,
      category: SkillCategory.tools,
      icon: Icons.assignment,
    ),
    const SkillModel(
      name: 'Slack',
      proficiency: 0.88,
      category: SkillCategory.tools,
      icon: Icons.chat,
    ),
    const SkillModel(
      name: 'Figma',
      proficiency: 0.85,
      category: SkillCategory.tools,
      icon: Icons.brush,
    ),
    const SkillModel(
      name: 'Postman',
      proficiency: 0.90,
      category: SkillCategory.tools,
      icon: Icons.http,
    ),
    const SkillModel(
      name: 'CI/CD (GitHub Actions)',
      proficiency: 0.80,
      category: SkillCategory.tools,
      icon: Icons.settings_applications,
    ),

    // Design & UI/UX
    const SkillModel(
      name: 'Responsive UI',
      proficiency: 0.92,
      category: SkillCategory.design,
      icon: Icons.devices,
    ),
    const SkillModel(
      name: 'Material Design',
      proficiency: 0.95,
      category: SkillCategory.design,
      icon: Icons.palette,
    ),

    // Core Competencies & Other Skills
    const SkillModel(
      name: 'Clean Architecture',
      proficiency: 0.90,
      category: SkillCategory.other,
      icon: Icons.architecture,
    ),
    const SkillModel(
      name: 'API Integration',
      proficiency: 0.92,
      category: SkillCategory.other,
      icon: Icons.integration_instructions,
    ),
    const SkillModel(
      name: 'Debugging',
      proficiency: 0.90,
      category: SkillCategory.other,
      icon: Icons.bug_report,
    ),
    const SkillModel(
      name: 'Performance Optimization',
      proficiency: 0.88,
      category: SkillCategory.other,
      icon: Icons.speed,
    ),
    const SkillModel(
      name: 'App Lifecycle Management',
      proficiency: 0.85,
      category: SkillCategory.other,
      icon: Icons.autorenew,
    ),
  ];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'proficiency': proficiency,
      'category': category.name,
    };
  }

  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      name: json['name'] as String,
      proficiency: (json['proficiency'] as num).toDouble(),
      category: SkillCategory.values.firstWhere(
        (e) => e.name == json['category'],
      ),
      icon: Icons.code, // Default icon
    );
  }
}
