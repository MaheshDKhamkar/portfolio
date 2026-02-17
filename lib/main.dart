import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/app_di.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';
import 'cubits/profile_cubit.dart';
import 'cubits/skills_cubit.dart';
import 'cubits/projects_cubit.dart';
import 'cubits/experience_cubit.dart';
import 'cubits/theme_cubit.dart';

void main() {
  // Initialize dependency injection
  setupDI();

  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileCubit>(create: (_) => getIt<ProfileCubit>()),
        BlocProvider<SkillsCubit>(create: (_) => getIt<SkillsCubit>()),
        BlocProvider<ProjectsCubit>(create: (_) => getIt<ProjectsCubit>()),
        BlocProvider<ExperienceCubit>(create: (_) => getIt<ExperienceCubit>()),
        BlocProvider<ThemeCubit>(create: (_) => getIt<ThemeCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp.router(
            title: 'Mahesh Khamkar Portfolio',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
