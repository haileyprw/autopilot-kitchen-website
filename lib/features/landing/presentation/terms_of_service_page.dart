import 'package:flutter/material.dart';

import '../../../core/constants/landing_breakpoints.dart';
import '../../../core/constants/terms_of_service_content.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms of Service'),
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
                    'Terms of Service',
                    style: theme.textTheme.headlineMedium,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Last updated: ${TermsOfServiceContent.lastUpdated}',
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  for (final section in TermsOfServiceContent.sections) ...[
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
