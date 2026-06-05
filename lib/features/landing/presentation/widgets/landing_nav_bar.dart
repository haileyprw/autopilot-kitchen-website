import 'package:flutter/material.dart';

import '../../../../core/constants/landing_breakpoints.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/ak_button.dart';
import '../../../../core/widgets/app_logo.dart';

class LandingNavBar extends StatelessWidget {
  const LandingNavBar({
    super.key,
    required this.onJoinWaitlist,
    required this.onHowItWorks,
    required this.onFeatures,
  });

  final VoidCallback onJoinWaitlist;
  final VoidCallback onHowItWorks;
  final VoidCallback onFeatures;

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= LandingBreakpoints.tablet;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.cream.withValues(alpha: 0.92),
        border: const Border(bottom: BorderSide(color: AppColors.divider)),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: LandingBreakpoints.maxContentWidth,
              ),
              child: Row(
                children: [
                  const _BrandMark(),
                  const Spacer(),
                  if (isWide) ...[
                    _NavLink(label: 'How It Works', onTap: onHowItWorks),
                    const SizedBox(width: AppSpacing.lg),
                    _NavLink(label: 'Features', onTap: onFeatures),
                    const SizedBox(width: AppSpacing.lg),
                  ],
                  AkButton(
                    label: 'Join Waitlist',
                    onPressed: onJoinWaitlist,
                    expand: false,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BrandMark extends StatelessWidget {
  const _BrandMark();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const AppLogo(size: 36),
        const SizedBox(width: AppSpacing.sm),
        Text(
          'Autopilot Kitchen',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}

class _NavLink extends StatefulWidget {
  const _NavLink({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          widget.label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: _hovered ? AppColors.sageDark : AppColors.inkMuted,
              ),
        ),
      ),
    );
  }
}
