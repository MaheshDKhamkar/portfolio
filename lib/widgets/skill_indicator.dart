import 'package:flutter/material.dart';
import '../models/skill_model.dart';
import '../core/theme/app_colors.dart';

/// Animated skill progress indicator widget
class SkillIndicator extends StatefulWidget {
  final SkillModel skill;
  final bool showPercentage;

  const SkillIndicator({
    super.key,
    required this.skill,
    this.showPercentage = true,
  });

  @override
  State<SkillIndicator> createState() => _SkillIndicatorState();
}

class _SkillIndicatorState extends State<SkillIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: widget.skill.proficiency,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  widget.skill.icon,
                  size: 20,
                  color: AppColors.lightPrimary,
                ),
                const SizedBox(width: 8),
                Text(
                  widget.skill.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            if (widget.showPercentage)
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Text(
                    '${(_animation.value * 100).toInt()}%',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.lightPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
          ],
        ),
        const SizedBox(height: 8),
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Stack(
              children: [
                Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: _animation.value,
                  child: Container(
                    height: 8,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: AppColors.primaryGradient,
                      ),
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.lightPrimary.withOpacity(0.3),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
