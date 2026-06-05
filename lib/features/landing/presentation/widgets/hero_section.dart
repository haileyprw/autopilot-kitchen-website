import 'package:flutter/material.dart';

import '../../../../core/constants/landing_breakpoints.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/ak_button.dart';
import 'app_mockup.dart';
import 'fade_in.dart';
import 'landing_section.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.onJoinWaitlist,
    required this.onHowItWorks,
  });

  final VoidCallback onJoinWaitlist;
  final VoidCallback onHowItWorks;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isWide = width >= LandingBreakpoints.desktop;
    final theme = Theme.of(context);

    return LandingSection(
      paddingVertical: isWide ? AppSpacing.sectionYLarge : AppSpacing.sectionY,
      child: isWide
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: _HeroCopy(theme: theme, onJoinWaitlist: onJoinWaitlist, onHowItWorks: onHowItWorks)),
                const SizedBox(width: AppSpacing.xxl),
                Expanded(child: _HeroMockups(width: width)),
              ],
            )
          : Column(
              children: [
                _HeroCopy(theme: theme, onJoinWaitlist: onJoinWaitlist, onHowItWorks: onHowItWorks),
                const SizedBox(height: AppSpacing.xxl),
                _HeroMockups(width: width),
              ],
            ),
    );
  }
}

class _HeroCopy extends StatelessWidget {
  const _HeroCopy({
    required this.theme,
    required this.onJoinWaitlist,
    required this.onHowItWorks,
  });

  final ThemeData theme;
  final VoidCallback onJoinWaitlist;
  final VoidCallback onHowItWorks;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm,
            ),
            decoration: BoxDecoration(
              color: AppColors.sage.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
            ),
            child: Text(
              'Coming soon',
              style: theme.textTheme.labelMedium?.copyWith(
                color: AppColors.sageDark,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Plan once.\nEat well for months.',
            style: theme.textTheme.displayMedium?.copyWith(
              fontSize: 48,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Autopilot Kitchen helps you build meal routines that automatically '
            'repeat, generate grocery lists, and remove the daily stress of '
            'deciding what to eat.',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: AppColors.inkMuted,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          Wrap(
            spacing: AppSpacing.md,
            runSpacing: AppSpacing.md,
            children: [
              SizedBox(
                width: 200,
                child: AkButton(
                  label: 'Join the Waitlist',
                  onPressed: onJoinWaitlist,
                  expand: true,
                ),
              ),
              SizedBox(
                width: 200,
                child: AkButton(
                  label: 'See How It Works',
                  onPressed: onHowItWorks,
                  variant: AkButtonVariant.secondary,
                  expand: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeroMockups extends StatelessWidget {
  const _HeroMockups({required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    final mockupWidth = width >= LandingBreakpoints.desktop
        ? 180.0
        : width >= LandingBreakpoints.mobile
            ? 150.0
            : 140.0;

    return FadeIn(
      delay: const Duration(milliseconds: 150),
      child: SizedBox(
        height: mockupWidth * 2.2,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: width >= LandingBreakpoints.mobile ? 0 : 8,
              child: Transform.rotate(
                angle: -0.06,
                child: AppMockup(screen: MockupScreen.plan, width: mockupWidth),
              ),
            ),
            Positioned(
              right: width >= LandingBreakpoints.mobile ? 0 : 8,
              child: Transform.rotate(
                angle: 0.06,
                child: AppMockup(screen: MockupScreen.grocery, width: mockupWidth),
              ),
            ),
            AppMockup(
              screen: MockupScreen.home,
              width: mockupWidth * 1.1,
            ),
          ],
        ),
      ),
    );
  }
}
