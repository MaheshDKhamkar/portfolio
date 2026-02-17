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

  /// Sample skills data
  static List<SkillModel> get samples => [
    // Languages
    const SkillModel(
      name: 'Dart',
      proficiency: 0.95,
      category: SkillCategory.languages,
      icon: Icons.code,
    ),
    const SkillModel(
      name: 'JavaScript',
      proficiency: 0.85,
      category: SkillCategory.languages,
      icon: Icons.javascript,
    ),
    const SkillModel(
      name: 'Python',
      proficiency: 0.75,
      category: SkillCategory.languages,
      icon: Icons.code,
    ),
    const SkillModel(
      name: 'TypeScript',
      proficiency: 0.80,
      category: SkillCategory.languages,
      icon: Icons.code,
    ),

    // Frameworks & Libraries
    const SkillModel(
      name: 'Flutter',
      proficiency: 0.95,
      category: SkillCategory.frameworks,
      icon: Icons.flutter_dash,
    ),
    const SkillModel(
      name: 'React',
      proficiency: 0.80,
      category: SkillCategory.frameworks,
      icon: Icons.web,
    ),
    const SkillModel(
      name: 'Node.js',
      proficiency: 0.75,
      category: SkillCategory.frameworks,
      icon: Icons.storage,
    ),
    const SkillModel(
      name: 'BLoC/Cubit',
      proficiency: 0.90,
      category: SkillCategory.frameworks,
      icon: Icons.architecture,
    ),
    const SkillModel(
      name: 'Provider',
      proficiency: 0.88,
      category: SkillCategory.frameworks,
      icon: Icons.settings_input_component,
    ),

    // Tools & Technologies
    const SkillModel(
      name: 'Firebase',
      proficiency: 0.90,
      category: SkillCategory.tools,
      icon: Icons.cloud,
    ),
    const SkillModel(
      name: 'Git & GitHub',
      proficiency: 0.92,
      category: SkillCategory.tools,
      icon: Icons.source,
    ),
    const SkillModel(
      name: 'REST APIs',
      proficiency: 0.90,
      category: SkillCategory.tools,
      icon: Icons.api,
    ),
    const SkillModel(
      name: 'GraphQL',
      proficiency: 0.70,
      category: SkillCategory.tools,
      icon: Icons.api,
    ),
    const SkillModel(
      name: 'Docker',
      proficiency: 0.65,
      category: SkillCategory.tools,
      icon: Icons.developer_board,
    ),
    const SkillModel(
      name: 'CI/CD',
      proficiency: 0.75,
      category: SkillCategory.tools,
      icon: Icons.settings_applications,
    ),

    // Design & UI/UX
    const SkillModel(
      name: 'UI/UX Design',
      proficiency: 0.85,
      category: SkillCategory.design,
      icon: Icons.design_services,
    ),
    const SkillModel(
      name: 'Figma',
      proficiency: 0.82,
      category: SkillCategory.design,
      icon: Icons.brush,
    ),
    const SkillModel(
      name: 'Material Design',
      proficiency: 0.95,
      category: SkillCategory.design,
      icon: Icons.palette,
    ),
    const SkillModel(
      name: 'Responsive Design',
      proficiency: 0.92,
      category: SkillCategory.design,
      icon: Icons.devices,
    ),

    // Other Skills
    const SkillModel(
      name: 'Agile/Scrum',
      proficiency: 0.85,
      category: SkillCategory.other,
      icon: Icons.groups,
    ),
    const SkillModel(
      name: 'Clean Architecture',
      proficiency: 0.90,
      category: SkillCategory.other,
      icon: Icons.architecture,
    ),
    const SkillModel(
      name: 'Testing',
      proficiency: 0.80,
      category: SkillCategory.other,
      icon: Icons.bug_report,
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
