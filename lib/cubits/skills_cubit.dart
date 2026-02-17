import 'package:flutter_bloc/flutter_bloc.dart';
import '../controllers/skills_controller.dart';
import '../models/skill_model.dart';
import 'skills_state.dart';

/// Skills Cubit - manages skills state
class SkillsCubit extends Cubit<SkillsState> {
  final SkillsController _controller;

  SkillsCubit(this._controller) : super(const SkillsInitial());

  /// Load skills data
  Future<void> loadSkills() async {
    try {
      emit(const SkillsLoading());
      final skills = await _controller.fetchSkills();
      final sortedSkills = _controller.sortByProficiency(skills);
      emit(SkillsLoaded(sortedSkills));
    } catch (e) {
      emit(SkillsError(e.toString()));
    }
  }

  /// Filter skills by category
  void filterByCategory(SkillCategory? category) {
    if (state is SkillsLoaded) {
      final currentState = state as SkillsLoaded;
      emit(
        currentState.copyWith(
          selectedCategory: category,
          clearCategory: category == null,
        ),
      );
    }
  }

  /// Clear category filter
  void clearFilter() {
    filterByCategory(null);
  }

  /// Refresh skills data
  Future<void> refreshSkills() async {
    await loadSkills();
  }
}
