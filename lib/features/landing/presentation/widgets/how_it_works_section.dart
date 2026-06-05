import 'package:flutter/material.dart';

import '../../../../core/constants/landing_breakpoints.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import 'fade_in.dart';
import 'landing_section.dart';

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  static const _steps = [
    'Save your favorite meals.',
    'Build reusable weekly meal plans.',
    'Assign weeks to your schedule.',
    'Generate grocery lists automatically.',
    'Repeat without starting over.',
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isWide = width >= LandingBreakpoints.desktop;
    final theme = Theme.of(context);

    return LandingSection(
      backgroundColor: Colors.white,
      id: 'how-it-works',
      child: Column(
        children: [
          FadeIn(
            child: Text(
              'How Autopilot Kitchen Works',
              style: theme.textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppSpacing.xxl),
          if (isWide)
            _HorizontalTimeline(steps: _steps, theme: theme)
          else
            _VerticalTimeline(steps: _steps, theme: theme),
        ],
      ),
    );
  }
}

class _HorizontalTimeline extends StatelessWidget {
  const _HorizontalTimeline({required this.steps, required this.theme});

  final List<String> steps;
  final ThemeData theme;

  static const _circleSize = 40.0;

  @override
  Widget build(BuildContext context) {
    final labelStyle = theme.textTheme.bodyMedium?.copyWith(
      color: AppColors.ink,
      fontWeight: FontWeight.w500,
      height: 1.4,
    );

    return FadeIn(
      delay: const Duration(milliseconds: 100),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final columnWidth = constraints.maxWidth / steps.length;

          return Column(
            children: [
              SizedBox(
                height: _circleSize,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: columnWidth / 2,
                      right: columnWidth / 2,
                      top: (_circleSize - 2) / 2,
                      child: const _ConnectorLine(),
                    ),
                    Row(
                      children: [
                        for (var i = 0; i < steps.length; i++)
                          Expanded(
                            child: Center(
                              child: _StepCircle(number: i + 1),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0; i < steps.length; i++)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.xs,
                        ),
                        child: Text(
                          steps[i],
                          textAlign: TextAlign.center,
                          style: labelStyle,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _VerticalTimeline extends StatelessWidget {
  const _VerticalTimeline({required this.steps, required this.theme});

  final List<String> steps;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < steps.length; i++)
          FadeIn(
            delay: Duration(milliseconds: 80 * i),
            child: _VerticalStep(
              number: i + 1,
              text: steps[i],
              theme: theme,
              isLast: i == steps.length - 1,
            ),
          ),
      ],
    );
  }
}

class _VerticalStep extends StatelessWidget {
  const _VerticalStep({
    required this.number,
    required this.text,
    required this.theme,
    required this.isLast,
  });

  final int number;
  final String text;
  final ThemeData theme;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : AppSpacing.lg),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              _StepCircle(number: number),
              if (!isLast) ...[
                const SizedBox(height: AppSpacing.xs),
                Container(
                  width: 2,
                  height: 32,
                  color: AppColors.divider,
                ),
              ],
            ],
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: AppSpacing.sm),
              child: Text(text, style: theme.textTheme.bodyLarge),
            ),
          ),
        ],
      ),
    );
  }
}

class _StepCircle extends StatelessWidget {
  const _StepCircle({required this.number});

  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.creamDark,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.sage, width: 1.5),
      ),
      child: Center(
        child: Text(
          '$number',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.sageDark,
          ),
        ),
      ),
    );
  }
}

class _ConnectorLine extends StatelessWidget {
  const _ConnectorLine();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      color: AppColors.divider,
    );
  }
}
