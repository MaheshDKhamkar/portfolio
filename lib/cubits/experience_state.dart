import 'package:equatable/equatable.dart';
import '../models/experience_model.dart';

/// Base state for experience
abstract class ExperienceState extends Equatable {
  const ExperienceState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class ExperienceInitial extends ExperienceState {
  const ExperienceInitial();
}

/// Loading state
class ExperienceLoading extends ExperienceState {
  const ExperienceLoading();
}

/// Loaded state with experience data
class ExperienceLoaded extends ExperienceState {
  final List<ExperienceModel> experiences;

  const ExperienceLoaded(this.experiences);

  @override
  List<Object?> get props => [experiences];
}

/// Error state
class ExperienceError extends ExperienceState {
  final String message;

  const ExperienceError(this.message);

  @override
  List<Object?> get props => [message];
}
