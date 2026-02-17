import 'package:flutter/material.dart';

/// Premium color palette for the portfolio application
class AppColors {
  // Prevent instantiation
  AppColors._();

  // Light Theme Colors
  static const Color lightPrimary = Color(0xFF6366F1); // Indigo
  static const Color lightSecondary = Color(0xFF8B5CF6); // Violet
  static const Color lightAccent = Color(0xFFEC4899); // Pink
  static const Color lightBackground = Color(0xFFF8FAFC);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightText = Color(0xFF1E293B);
  static const Color lightTextSecondary = Color(0xFF64748B);

  // Dark Theme Colors
  static const Color darkPrimary = Color(0xFF818CF8); // Light Indigo
  static const Color darkSecondary = Color(0xFFA78BFA); // Light Violet
  static const Color darkAccent = Color(0xFFF472B6); // Light Pink
  static const Color darkBackground = Color(0xFF0F172A);
  static const Color darkSurface = Color(0xFF1E293B);
  static const Color darkText = Color(0xFFF1F5F9);
  static const Color darkTextSecondary = Color(0xFF94A3B8);

  // Gradient Colors
  static const List<Color> primaryGradient = [
    Color(0xFF6366F1),
    Color(0xFF8B5CF6),
  ];

  static const List<Color> accentGradient = [
    Color(0xFFEC4899),
    Color(0xFFF59E0B),
  ];

  static const List<Color> successGradient = [
    Color(0xFF10B981),
    Color(0xFF3B82F6),
  ];

  // Glass effect colors
  static Color glassLight = Colors.white.withOpacity(0.1);
  static Color glassDark = Colors.black.withOpacity(0.2);

  // Common Colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);
}
