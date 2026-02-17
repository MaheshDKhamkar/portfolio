import 'package:flutter/material.dart';
import '../models/experience_model.dart';
import '../core/theme/app_colors.dart';

/// Timeline item widget for experience display
class TimelineItem extends StatelessWidget {
  final ExperienceModel experience;
  final bool isLast;

  const TimelineItem({
    super.key,
    required this.experience,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline indicator
        Column(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: AppColors.primaryGradient,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.lightPrimary.withOpacity(0.3),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: experience.isCurrent
                  ? const Icon(Icons.work, color: Colors.white, size: 20)
                  : const Icon(Icons.check, color: Colors.white, size: 20),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 100,
                color: AppColors.lightPrimary.withOpacity(0.3),
              ),
          ],
        ),
        const SizedBox(width: 16),
        // Content
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        experience.position,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    if (experience.isCurrent)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.success.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          'Current',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: AppColors.success),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  experience.companyName,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.lightPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${experience.durationString} • ${experience.durationDisplay}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  experience.location,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 12),
                ...experience.responsibilities.map(
                  (resp) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('• '),
                        Expanded(
                          child: Text(
                            resp,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
