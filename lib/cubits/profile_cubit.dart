import 'package:flutter_bloc/flutter_bloc.dart';
import '../controllers/profile_controller.dart';
import 'profile_state.dart';

/// Profile Cubit - manages profile state
class ProfileCubit extends Cubit<ProfileState> {
  final ProfileController _controller;

  ProfileCubit(this._controller) : super(const ProfileInitial());

  /// Load profile data
  Future<void> loadProfile() async {
    try {
      emit(const ProfileLoading());
      final profile = await _controller.fetchProfile();
      emit(ProfileLoaded(profile));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  /// Refresh profile data
  Future<void> refreshProfile() async {
    await loadProfile();
  }
}
