import 'package:flutter/material.dart';

import '../../../../core/constants/landing_breakpoints.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import 'app_mockup.dart';
import 'fade_in.dart';
import 'landing_section.dart';

class AppPreviewSection extends StatelessWidget {
  const AppPreviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isWide = width >= LandingBreakpoints.tablet;
    final mockupWidth = isWide ? 240.0 : 180.0;
    final theme = Theme.of(context);

    return LandingSection(
      child: Column(
        children: [
          FadeIn(
            child: Text(
              'Designed to feel calm and effortless.',
              style: theme.textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          FadeIn(
            delay: const Duration(milliseconds: 80),
            child: Text(
              'Every screen is built to reduce noise, not add to it.',
              style: theme.textTheme.bodyLarge?.copyWith(color: AppColors.inkMuted),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppSpacing.xxl),
          FadeIn(
            delay: const Duration(milliseconds: 150),
            child: isWide
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _PreviewItem(
                        label: 'Home Screen',
                        mockup: AppMockup(screen: MockupScreen.home, width: mockupWidth),
                      ),
                      const SizedBox(width: AppSpacing.xl),
                      _PreviewItem(
                        label: 'Plan Screen',
                        mockup: AppMockup(
                          screen: MockupScreen.plan,
                          width: mockupWidth * 1.05,
                          elevated: true,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.xl),
                      _PreviewItem(
                        label: 'Grocery Screen',
                        mockup: AppMockup(screen: MockupScreen.grocery, width: mockupWidth),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      _PreviewItem(
                        label: 'Home Screen',
                        mockup: AppMockup(screen: MockupScreen.home, width: mockupWidth),
                      ),
                      const SizedBox(height: AppSpacing.xl),
                      _PreviewItem(
                        label: 'Plan Screen',
                        mockup: AppMockup(screen: MockupScreen.plan, width: mockupWidth),
                      ),
                      const SizedBox(height: AppSpacing.xl),
                      _PreviewItem(
                        label: 'Grocery Screen',
                        mockup: AppMockup(screen: MockupScreen.grocery, width: mockupWidth),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

class _PreviewItem extends StatelessWidget {
  const _PreviewItem({required this.label, required this.mockup});

  final String label;
  final Widget mockup;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        mockup,
        const SizedBox(height: AppSpacing.md),
        Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppColors.inkMuted,
              ),
        ),
      ],
    );
  }
}
