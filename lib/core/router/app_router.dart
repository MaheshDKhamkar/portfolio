import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../views/about_screen.dart';
import '../../views/contact_screen.dart';
import '../../views/experience_screen.dart';
import '../../views/home_screen.dart';
import '../../views/projects_screen.dart';
import '../../views/skills_screen.dart';
import '../../views/splash_screen.dart';

/// Application router configuration using GoRouter
class AppRouter {
  // Prevent instantiation
  AppRouter._();

  // Route names
  static const String splash = '/';
  static const String home = '/home';
  static const String about = '/about';
  static const String skills = '/skills';
  static const String projects = '/projects';
  static const String experience = '/experience';
  static const String contact = '/contact';

  /// GoRouter configuration
  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(
        path: splash,
        name: 'splash',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const SplashScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      GoRoute(
        path: home,
        name: 'home',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position:
                    Tween<Offset>(
                      begin: const Offset(0, 0.1),
                      end: Offset.zero,
                    ).animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeOutCubic,
                      ),
                    ),
                child: child,
              ),
            );
          },
        ),
      ),
      GoRoute(
        path: about,
        name: 'about',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const AboutScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      GoRoute(
        path: skills,
        name: 'skills',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const SkillsScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      GoRoute(
        path: projects,
        name: 'projects',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const ProjectsScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      GoRoute(
        path: experience,
        name: 'experience',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const ExperienceScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      GoRoute(
        path: contact,
        name: 'contact',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const ContactScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
    ],
  );
}
