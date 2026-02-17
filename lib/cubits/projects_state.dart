import 'package:equatable/equatable.dart';
import '../models/project_model.dart';

/// Base state for projects
abstract class ProjectsState extends Equatable {
  const ProjectsState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class ProjectsInitial extends ProjectsState {
  const ProjectsInitial();
}

/// Loading state
class ProjectsLoading extends ProjectsState {
  const ProjectsLoading();
}

/// Loaded state with projects data
class ProjectsLoaded extends ProjectsState {
  final List<ProjectModel> projects;
  final ProjectStatus? selectedStatus;
  final String? selectedTechnology;

  const ProjectsLoaded(
    this.projects, {
    this.selectedStatus,
    this.selectedTechnology,
  });

  /// Get filtered projects
  List<ProjectModel> get filteredProjects {
    var filtered = projects;

    if (selectedStatus != null) {
      filtered = filtered.where((p) => p.status == selectedStatus).toList();
    }

    if (selectedTechnology != null && selectedTechnology!.isNotEmpty) {
      filtered = filtered
          .where((p) => p.technologies.contains(selectedTechnology))
          .toList();
    }

    return filtered;
  }

  @override
  List<Object?> get props => [projects, selectedStatus, selectedTechnology];

  ProjectsLoaded copyWith({
    List<ProjectModel>? projects,
    ProjectStatus? selectedStatus,
    String? selectedTechnology,
    bool clearStatus = false,
    bool clearTechnology = false,
  }) {
    return ProjectsLoaded(
      projects ?? this.projects,
      selectedStatus: clearStatus
          ? null
          : (selectedStatus ?? this.selectedStatus),
      selectedTechnology: clearTechnology
          ? null
          : (selectedTechnology ?? this.selectedTechnology),
    );
  }
}

/// Error state
class ProjectsError extends ProjectsState {
  final String message;

  const ProjectsError(this.message);

  @override
  List<Object?> get props => [message];
}
