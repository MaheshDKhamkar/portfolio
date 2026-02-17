import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Theme Cubit - manages app theme (light/dark mode)
class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light);

  /// Toggle between light and dark theme
  void toggleTheme() {
    emit(state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
  }

  /// Set light theme
  void setLightTheme() {
    emit(ThemeMode.light);
  }

  /// Set dark theme
  void setDarkTheme() {
    emit(ThemeMode.dark);
  }

  /// Check if dark mode is active
  bool get isDarkMode => state == ThemeMode.dark;
}
