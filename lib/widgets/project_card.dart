import 'package:flutter/material.dart';
import '../models/project_model.dart';
import '../core/theme/app_colors.dart';
import 'glass_card.dart';

/// Project card widget
class ProjectCard extends StatelessWidget {
  final ProjectModel project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project image placeholder
          Container(
            height: 120,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: AppColors.primaryGradient),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Icon(Icons.image, size: 50, color: Colors.white),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            project.name,
            style: Theme.of(context).textTheme.titleLarge,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Text(
            project.description,
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: project.technologies.take(3).map((tech) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.lightPrimary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: AppColors.lightPrimary.withOpacity(0.3),
                  ),
                ),
                child: Text(
                  tech,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.lightPrimary,
                  ),
                ),
              );
            }).toList(),
          ),
          const Spacer(),
          Row(
            children: [
              if (project.githubUrl != null)
                IconButton(
                  icon: const Icon(Icons.code),
                  onPressed: () {},
                  tooltip: 'View Code',
                ),
              if (project.playStoreUrl != null)
                IconButton(
                  icon: const Icon(Icons.shop),
                  onPressed: () {},
                  tooltip: 'Play Store',
                ),
              if (project.webUrl != null)
                IconButton(
                  icon: const Icon(Icons.language),
                  onPressed: () {},
                  tooltip: 'Visit Website',
                ),
            ],
          ),
        ],
      ),
    );
  }
}
