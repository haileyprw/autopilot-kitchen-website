import 'package:flutter/material.dart';

import '../../../../core/constants/landing_breakpoints.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/ak_card.dart';
import 'fade_in.dart';
import 'landing_section.dart';

class SocialProofSection extends StatelessWidget {
  const SocialProofSection({super.key});

  static const _testimonials = [
    (
      quote:
          'I stopped dreading Sunday meal prep. My Week A plan just shows up when I need it.',
      name: 'Sarah M.',
      context: 'Beta tester, parent of two',
    ),
    (
      quote:
          'The grocery list alone saves me an hour every week. Everything is already there.',
      name: 'James T.',
      context: 'Early access user',
    ),
    (
      quote:
          'It feels like the app respects my time. No clutter, no guilt, just a clear plan.',
      name: 'Priya K.',
      context: 'Beta feedback',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final columns = width >= LandingBreakpoints.desktop ? 3 : 1;
    final theme = Theme.of(context);

    return LandingSection(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          FadeIn(
            child: Text(
              'Built for real life.',
              style: theme.textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          FadeIn(
            delay: const Duration(milliseconds: 80),
            child: Text(
              'Early testers are already simplifying how they eat.',
              style: theme.textTheme.bodyLarge?.copyWith(color: AppColors.inkMuted),
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
                  for (var i = 0; i < _testimonials.length; i++)
                    SizedBox(
                      width: cardWidth,
                      child: FadeIn(
                        delay: Duration(milliseconds: 100 * i),
                        child: AkCard(
                          hoverable: true,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.format_quote,
                                color: AppColors.sage.withValues(alpha: 0.5),
                                size: 28,
                              ),
                              const SizedBox(height: AppSpacing.sm),
                              Text(
                                _testimonials[i].quote,
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  fontStyle: FontStyle.italic,
                                  color: AppColors.ink,
                                ),
                              ),
                              const SizedBox(height: AppSpacing.lg),
                              Text(
                                _testimonials[i].name,
                                style: theme.textTheme.titleMedium,
                              ),
                              const SizedBox(height: AppSpacing.xs),
                              Text(
                                _testimonials[i].context,
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
