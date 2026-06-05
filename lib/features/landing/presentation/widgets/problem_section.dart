import 'package:flutter/material.dart';

import '../../../../core/constants/landing_breakpoints.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/ak_card.dart';
import 'fade_in.dart';
import 'landing_section.dart';

class ProblemSection extends StatelessWidget {
  const ProblemSection({super.key});

  static const _painPoints = [
    (
      icon: Icons.help_outline,
      title: 'Decide what to eat every day',
      description:
          'The same question, every evening. It adds up faster than you expect.',
    ),
    (
      icon: Icons.receipt_long_outlined,
      title: 'Rebuild grocery lists every week',
      description:
          'Starting from scratch each trip means more time planning, less time living.',
    ),
    (
      icon: Icons.history,
      title: 'Forget meals that worked well',
      description:
          'Good recipes get buried. Weeks later, you are back to square one.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final columns = width >= LandingBreakpoints.desktop
        ? 3
        : width >= LandingBreakpoints.mobile
            ? 2
            : 1;
    final theme = Theme.of(context);

    return LandingSection(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          FadeIn(
            child: Text(
              'Meal planning shouldn\'t be a weekly chore.',
              style: theme.textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppSpacing.xxl),
          LayoutBuilder(
            builder: (context, constraints) {
              final cardWidth = columns == 1
                  ? constraints.maxWidth
                  : (constraints.maxWidth - AppSpacing.lg * (columns - 1)) / columns;

              return Wrap(
                spacing: AppSpacing.lg,
                runSpacing: AppSpacing.lg,
                alignment: WrapAlignment.center,
                children: [
                  for (var i = 0; i < _painPoints.length; i++)
                    SizedBox(
                      width: cardWidth,
                      child: FadeIn(
                        delay: Duration(milliseconds: 100 * i),
                        child: AkCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: AppColors.terracotta.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  _painPoints[i].icon,
                                  color: AppColors.terracotta,
                                  size: 22,
                                ),
                              ),
                              const SizedBox(height: AppSpacing.md),
                              Text(
                                _painPoints[i].title,
                                style: theme.textTheme.titleMedium,
                              ),
                              const SizedBox(height: AppSpacing.sm),
                              Text(
                                _painPoints[i].description,
                                style: theme.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
