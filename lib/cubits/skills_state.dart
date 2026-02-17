import 'package:equatable/equatable.dart';
import '../models/skill_model.dart';

/// Base state for skills
abstract class SkillsState extends Equatable {
  const SkillsState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class SkillsInitial extends SkillsState {
  const SkillsInitial();
}

/// Loading state
class SkillsLoading extends SkillsState {
  const SkillsLoading();
}

/// Loaded state with skills data
class SkillsLoaded extends SkillsState {
  final List<SkillModel> skills;
  final SkillCategory? selectedCategory;

  const SkillsLoaded(this.skills, {this.selectedCategory});

  /// Get filtered skills by selected category
  List<SkillModel> get filteredSkills {
    if (selectedCategory == null) {
      return skills;
    }
    return skills.where((skill) => skill.category == selectedCategory).toList();
  }

  @override
  List<Object?> get props => [skills, selectedCategory];

  SkillsLoaded copyWith({
    List<SkillModel>? skills,
    SkillCategory? selectedCategory,
    bool clearCategory = false,
  }) {
    return SkillsLoaded(
      skills ?? this.skills,
      selectedCategory: clearCategory
          ? null
          : (selectedCategory ?? this.selectedCategory),
    );
  }
}

/// Error state
class SkillsError extends SkillsState {
  final String message;

  const SkillsError(this.message);

  @override
  List<Object?> get props => [message];
}
