import 'package:flutter_bloc/flutter_bloc.dart';
import '../controllers/projects_controller.dart';
import '../models/project_model.dart';
import 'projects_state.dart';

/// Projects Cubit - manages projects state
class ProjectsCubit extends Cubit<ProjectsState> {
  final ProjectsController _controller;

  ProjectsCubit(this._controller) : super(const ProjectsInitial());

  /// Load projects data
  Future<void> loadProjects() async {
    try {
      emit(const ProjectsLoading());
      final projects = await _controller.fetchProjects();
      emit(ProjectsLoaded(projects));
    } catch (e) {
      emit(ProjectsError(e.toString()));
    }
  }

  /// Filter projects by status
  void filterByStatus(ProjectStatus? status) {
    if (state is ProjectsLoaded) {
      final currentState = state as ProjectsLoaded;
      emit(
        currentState.copyWith(
          selectedStatus: status,
          clearStatus: status == null,
        ),
      );
    }
  }

  /// Filter projects by technology
  void filterByTechnology(String? technology) {
    if (state is ProjectsLoaded) {
      final currentState = state as ProjectsLoaded;
      emit(
        currentState.copyWith(
          selectedTechnology: technology,
          clearTechnology: technology == null || technology.isEmpty,
        ),
      );
    }
  }

  /// Clear all filters
  void clearFilters() {
    if (state is ProjectsLoaded) {
      final currentState = state as ProjectsLoaded;
      emit(currentState.copyWith(clearStatus: true, clearTechnology: true));
    }
  }

  /// Refresh projects data
  Future<void> refreshProjects() async {
    await loadProjects();
  }
}
