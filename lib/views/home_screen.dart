import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:go_router/go_router.dart';
import '../cubits/profile_cubit.dart';
import '../cubits/profile_state.dart';
import '../core/theme/app_colors.dart';
import '../core/router/app_router.dart';
import '../core/di/app_di.dart';
import '../widgets/gradient_button.dart';
import '../widgets/responsive_layout.dart';
import '../widgets/thread_loader.dart';

/// Home/Landing screen
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getIt<ProfileCubit>().loadProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileCubit, ProfileState>(
        bloc: getIt<ProfileCubit>(),
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: ThreadLoader());
          }

          if (state is ProfileError) {
            return Center(child: Text('Error: ${state.message}'));
          }

          if (state is ProfileLoaded) {
            final profile = state.profile;
            return ResponsiveLayout(
              mobile: _buildMobileLayout(context, profile),
              tablet: _buildTabletLayout(context, profile),
              desktop: _buildDesktopLayout(context, profile),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context, profile) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.background,
              Theme.of(context).colorScheme.surface,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Hero(
                tag: 'profile',
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: AppColors.primaryGradient,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.lightPrimary.withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                profile.name,
                style: Theme.of(context).textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    profile.title,
                    textStyle: Theme.of(context).textTheme.headlineSmall
                        ?.copyWith(color: AppColors.lightPrimary),
                    speed: const Duration(milliseconds: 100),
                  ),
                  TypewriterAnimatedText(
                    '${profile.yearsOfExperience.toStringAsFixed(1)}+ Years Experience',
                    textStyle: Theme.of(context).textTheme.headlineSmall
                        ?.copyWith(color: AppColors.lightSecondary),
                    speed: const Duration(milliseconds: 100),
                  ),
                ],
                repeatForever: true,
                pause: const Duration(milliseconds: 2000),
              ),
              const SizedBox(height: 32),
              Text(
                profile.bio,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
                maxLines: 6,
              ),
              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GradientButton(
                    onPressed: () => context.go(AppRouter.projects),
                    text: 'View Projects',
                  ),
                  const SizedBox(width: 16),
                  GradientButton(
                    onPressed: () => context.go(AppRouter.contact),
                    text: 'Contact Me',
                    gradient: AppColors.accentGradient,
                  ),
                ],
              ),
              const SizedBox(height: 48),
              _buildQuickLinks(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabletLayout(BuildContext context, profile) {
    return _buildMobileLayout(context, profile);
  }

  Widget _buildDesktopLayout(BuildContext context, profile) {
    return _buildMobileLayout(context, profile);
  }

  Widget _buildQuickLinks(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: [
        _buildQuickLinkButton(context, 'About', Icons.person, AppRouter.about),
        _buildQuickLinkButton(context, 'Skills', Icons.code, AppRouter.skills),
        _buildQuickLinkButton(
          context,
          'Projects',
          Icons.work,
          AppRouter.projects,
        ),
        _buildQuickLinkButton(
          context,
          'Experience',
          Icons.timeline,
          AppRouter.experience,
        ),
        _buildQuickLinkButton(
          context,
          'Contact',
          Icons.email,
          AppRouter.contact,
        ),
      ],
    );
  }

  Widget _buildQuickLinkButton(
    BuildContext context,
    String label,
    IconData icon,
    String route,
  ) {
    return InkWell(
      onTap: () => context.go(route),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.lightPrimary.withOpacity(0.2)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 20, color: AppColors.lightPrimary),
            const SizedBox(width: 8),
            Text(label),
          ],
        ),
      ),
    );
  }
}
