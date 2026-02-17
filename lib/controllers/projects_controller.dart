import '../models/project_model.dart';
import 'package:url_launcher/url_launcher.dart';

/// Projects controller - handles projects business logic
class ProjectsController {
  /// Fetch all projects
  Future<List<ProjectModel>> fetchProjects() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 700));

    // Return sample data sorted by completion date (most recent first)
    final projects = ProjectModel.samples;
    projects.sort((a, b) {
      final aDate = a.completedDate ?? DateTime.now();
      final bDate = b.completedDate ?? DateTime.now();
      return bDate.compareTo(aDate);
    });
    return projects;
  }

  /// Filter projects by technology
  List<ProjectModel> filterByTechnology(
    List<ProjectModel> projects,
    String technology,
  ) {
    return projects
        .where((project) => project.technologies.contains(technology))
        .toList();
  }

  /// Filter projects by status
  List<ProjectModel> filterByStatus(
    List<ProjectModel> projects,
    ProjectStatus status,
  ) {
    return projects.where((project) => project.status == status).toList();
  }

  /// Get all unique technologies from projects
  List<String> getAllTechnologies(List<ProjectModel> projects) {
    final Set<String> technologies = {};
    for (final project in projects) {
      technologies.addAll(project.technologies);
    }
    return technologies.toList()..sort();
  }

  /// Launch external URL
  Future<bool> launchExternalUrl(String urlString) async {
    try {
      final uri = Uri.parse(urlString);
      return await launchUrl(uri);
    } catch (e) {
      return false;
    }
  }

  /// Launch GitHub URL
  Future<bool> launchGithub(ProjectModel project) async {
    if (project.githubUrl != null) {
      return await launchExternalUrl(project.githubUrl!);
    }
    return false;
  }

  /// Launch Play Store URL
  Future<bool> launchPlayStore(ProjectModel project) async {
    if (project.playStoreUrl != null) {
      return await launchExternalUrl(project.playStoreUrl!);
    }
    return false;
  }

  /// Launch App Store URL
  Future<bool> launchAppStore(ProjectModel project) async {
    if (project.appStoreUrl != null) {
      return await launchExternalUrl(project.appStoreUrl!);
    }
    return false;
  }

  /// Launch Web URL
  Future<bool> launchWeb(ProjectModel project) async {
    if (project.webUrl != null) {
      return await launchExternalUrl(project.webUrl!);
    }
    return false;
  }
}
