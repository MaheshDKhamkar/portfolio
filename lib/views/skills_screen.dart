import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/skills_cubit.dart';
import '../cubits/skills_state.dart';
import '../core/di/app_di.dart';
import '../models/skill_model.dart';
import '../widgets/skill_indicator.dart';
import '../widgets/thread_loader.dart';

/// Skills screen
class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  @override
  void initState() {
    super.initState();
    getIt<SkillsCubit>().loadSkills();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Skills')),
      body: BlocBuilder<SkillsCubit, SkillsState>(
        bloc: getIt<SkillsCubit>(),
        builder: (context, state) {
          if (state is SkillsLoading) {
            return const Center(child: ThreadLoader());
          }

          if (state is SkillsError) {
            return Center(child: Text('Error: ${state.message}'));
          }

          if (state is SkillsLoaded) {
            return ListView(
              padding: const EdgeInsets.all(24),
              children: [
                ...SkillCategory.values.map((category) {
                  final skillsInCategory = state.skills
                      .where((s) => s.category == category)
                      .toList();

                  if (skillsInCategory.isEmpty) return const SizedBox.shrink();

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category.displayName,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 16),
                      ...skillsInCategory.map(
                        (skill) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: SkillIndicator(skill: skill),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  );
                }),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
