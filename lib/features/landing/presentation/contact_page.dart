import 'package:flutter/material.dart';

import '../../../core/constants/app_links.dart';
import '../../../core/constants/landing_breakpoints.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.xl,
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: LandingBreakpoints.maxContentWidth,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get in touch',
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  'Questions about Autopilot Kitchen, the waitlist, or your data? '
                  'We\'d love to hear from you.',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: AppColors.inkMuted,
                    height: 1.55,
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                Text(
                  'Email',
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: AppSpacing.sm),
                SelectableText(
                  AppLinks.supportEmail,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: AppColors.sageDark,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
