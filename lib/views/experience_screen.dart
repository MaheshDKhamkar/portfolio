import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/experience_cubit.dart';
import '../cubits/experience_state.dart';
import '../core/di/app_di.dart';
import '../widgets/timeline_item.dart';

/// Experience screen
class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  @override
  void initState() {
    super.initState();
    getIt<ExperienceCubit>().loadExperience();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Experience')),
      body: BlocBuilder<ExperienceCubit, ExperienceState>(
        bloc: getIt<ExperienceCubit>(),
        builder: (context, state) {
          if (state is ExperienceLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ExperienceError) {
            return Center(child: Text('Error: ${state.message}'));
          }

          if (state is ExperienceLoaded) {
            return ListView.builder(
              padding: const EdgeInsets.all(24),
              itemCount: state.experiences.length,
              itemBuilder: (context, index) {
                return TimelineItem(
                  experience: state.experiences[index],
                  isLast: index == state.experiences.length - 1,
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
