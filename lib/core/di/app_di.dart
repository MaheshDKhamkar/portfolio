import 'package:get_it/get_it.dart';

import '../../controllers/contact_controller.dart';
import '../../controllers/experience_controller.dart';
import '../../controllers/profile_controller.dart';
import '../../controllers/projects_controller.dart';
import '../../controllers/skills_controller.dart';
import '../../cubits/experience_cubit.dart';
import '../../cubits/profile_cubit.dart';
import '../../cubits/projects_cubit.dart';
import '../../cubits/skills_cubit.dart';
import '../../cubits/theme_cubit.dart';

/// GetIt instance for dependency injection
final getIt = GetIt.instance;

/// Setup all dependency injections
void setupDI() {
  // Register Controllers (Lazy Singletons)
  getIt.registerLazySingleton<ProfileController>(() => ProfileController());
  getIt.registerLazySingleton<SkillsController>(() => SkillsController());
  getIt.registerLazySingleton<ProjectsController>(() => ProjectsController());
  getIt.registerLazySingleton<ExperienceController>(
    () => ExperienceController(),
  );
  getIt.registerLazySingleton<ContactController>(() => ContactController());

  // Register Cubits (Lazy Singletons)
  getIt.registerLazySingleton<ProfileCubit>(
    () => ProfileCubit(getIt<ProfileController>()),
  );
  getIt.registerLazySingleton<SkillsCubit>(
    () => SkillsCubit(getIt<SkillsController>()),
  );
  getIt.registerLazySingleton<ProjectsCubit>(
    () => ProjectsCubit(getIt<ProjectsController>()),
  );
  getIt.registerLazySingleton<ExperienceCubit>(
    () => ExperienceCubit(getIt<ExperienceController>()),
  );
  getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
}
