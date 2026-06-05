import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../services/waitlist_service.dart';
import 'fade_in.dart';
import 'landing_section.dart';
import 'waitlist_form.dart';

class WaitlistSection extends StatelessWidget {
  const WaitlistSection({
    super.key,
    required this.service,
  });

  final WaitlistService service;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LandingSection(
      id: 'waitlist',
      paddingVertical: AppSpacing.sectionYLarge,
      child: FadeIn(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.xl),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.divider),
          ),
          child: Column(
            children: [
              Text(
                'Stop planning meals from scratch.',
                style: theme.textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Join the waitlist and be first to try Autopilot Kitchen.',
                style: theme.textTheme.bodyLarge?.copyWith(color: AppColors.inkMuted),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.xl),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 520),
                child: WaitlistForm(service: service),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
