import '../models/skill_model.dart';

/// Skills controller - handles skills business logic
class SkillsController {
  /// Fetch all skills
  Future<List<SkillModel>> fetchSkills() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 600));

    // Return sample data
    return SkillModel.samples;
  }

  /// Filter skills by category
  List<SkillModel> filterByCategory(
    List<SkillModel> skills,
    SkillCategory category,
  ) {
    return skills.where((skill) => skill.category == category).toList();
  }

  /// Sort skills by proficiency (descending)
  List<SkillModel> sortByProficiency(List<SkillModel> skills) {
    final sortedSkills = List<SkillModel>.from(skills);
    sortedSkills.sort((a, b) => b.proficiency.compareTo(a.proficiency));
    return sortedSkills;
  }

  /// Get skills grouped by category
  Map<SkillCategory, List<SkillModel>> getSkillsByCategory(
    List<SkillModel> skills,
  ) {
    final Map<SkillCategory, List<SkillModel>> grouped = {};
    for (final skill in skills) {
      if (!grouped.containsKey(skill.category)) {
        grouped[skill.category] = [];
      }
      grouped[skill.category]!.add(skill);
    }
    return grouped;
  }
}
