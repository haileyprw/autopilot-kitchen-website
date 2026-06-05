import 'package:flutter/material.dart';

import '../../../core/constants/landing_breakpoints.dart';
import '../../../core/constants/privacy_policy_content.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: SelectionArea(
        child: Center(
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
                    'Privacy Policy',
                    style: theme.textTheme.headlineMedium,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Last updated: ${PrivacyPolicyContent.lastUpdated}',
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  for (final section in PrivacyPolicyContent.sections) ...[
                    Text(
                      section.title,
                      style: theme.textTheme.titleLarge,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      section.body,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: AppColors.inkMuted,
                        height: 1.55,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xl),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
