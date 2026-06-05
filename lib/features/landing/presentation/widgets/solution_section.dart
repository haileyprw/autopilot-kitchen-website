import 'package:flutter/material.dart';

import '../../../../core/constants/landing_breakpoints.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/ak_card.dart';
import 'fade_in.dart';
import 'landing_section.dart';

class SolutionSection extends StatelessWidget {
  const SolutionSection({super.key});

  static const _features = [
    (
      icon: Icons.repeat,
      title: 'Meal Rotations',
      description:
          'Create Week A, Week B, Week C and reuse them whenever you want.',
      color: AppColors.sage,
    ),
    (
      icon: Icons.menu_book_outlined,
      title: 'Recipe Library',
      description:
          'Save recipes from anywhere and keep everything organized.',
      color: AppColors.terracotta,
    ),
    (
      icon: Icons.shopping_bag_outlined,
      title: 'Automatic Grocery Lists',
      description:
          'Generate shopping lists instantly from your meal plan.',
      color: AppColors.sageDark,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final columns = width >= LandingBreakpoints.desktop ? 3 : 1;
    final theme = Theme.of(context);

    return LandingSection(
      child: Column(
        children: [
          FadeIn(
            child: Text(
              'Build a system once. Reuse it forever.',
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
                  for (var i = 0; i < _features.length; i++)
                    SizedBox(
                      width: cardWidth,
                      child: FadeIn(
                        delay: Duration(milliseconds: 100 * i),
                        child: AkCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: _features[i].color.withValues(alpha: 0.12),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Icon(
                                  _features[i].icon,
                                  color: _features[i].color,
                                  size: 24,
                                ),
                              ),
                              const SizedBox(height: AppSpacing.md),
                              Text(
                                _features[i].title,
                                style: theme.textTheme.titleLarge,
                              ),
                              const SizedBox(height: AppSpacing.sm),
                              Text(
                                _features[i].description,
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
