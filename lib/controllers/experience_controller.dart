import '../models/experience_model.dart';

/// Experience controller - handles work experience business logic
class ExperienceController {
  /// Fetch all work experience
  Future<List<ExperienceModel>> fetchExperience() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 650));

    // Return sample data sorted by start date (most recent first)
    final experiences = ExperienceModel.samples;
    experiences.sort((a, b) => b.startDate.compareTo(a.startDate));
    return experiences;
  }

  /// Get current position
  ExperienceModel? getCurrentPosition(List<ExperienceModel> experiences) {
    try {
      return experiences.firstWhere((exp) => exp.isCurrent);
    } catch (e) {
      return null;
    }
  }

  /// Get total years of experience
  double getTotalYearsOfExperience(List<ExperienceModel> experiences) {
    if (experiences.isEmpty) return 0.0;

    // Get the earliest start date
    final earliestStart = experiences
        .map((e) => e.startDate)
        .reduce((a, b) => a.isBefore(b) ? a : b);

    final now = DateTime.now();
    final totalMonths =
        ((now.year - earliestStart.year) * 12) +
        (now.month - earliestStart.month);

    return totalMonths / 12.0;
  }

  /// Filter by company
  List<ExperienceModel> filterByCompany(
    List<ExperienceModel> experiences,
    String companyName,
  ) {
    return experiences
        .where(
          (exp) =>
              exp.companyName.toLowerCase().contains(companyName.toLowerCase()),
        )
        .toList();
  }
}
