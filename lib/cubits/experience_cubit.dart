import 'package:flutter_bloc/flutter_bloc.dart';
import '../controllers/experience_controller.dart';
import 'experience_state.dart';

/// Experience Cubit - manages experience state
class ExperienceCubit extends Cubit<ExperienceState> {
  final ExperienceController _controller;

  ExperienceCubit(this._controller) : super(const ExperienceInitial());

  /// Load experience data
  Future<void> loadExperience() async {
    try {
      emit(const ExperienceLoading());
      final experiences = await _controller.fetchExperience();
      emit(ExperienceLoaded(experiences));
    } catch (e) {
      emit(ExperienceError(e.toString()));
    }
  }

  /// Refresh experience data
  Future<void> refreshExperience() async {
    await loadExperience();
  }
}
