import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_links.dart';
import '../../../../core/constants/landing_breakpoints.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_logo.dart';
import '../contact_page.dart';

class LandingFooter extends StatelessWidget {
  const LandingFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isWide = width >= LandingBreakpoints.mobile;
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.xl,
      ),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.divider)),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: LandingBreakpoints.maxContentWidth,
          ),
          child: isWide
              ? Row(
                  children: [
                    const _BrandMark(),
                    const Spacer(),
                    _FooterLinks(theme: theme),
                  ],
                )
              : Column(
                  children: [
                    const _BrandMark(),
                    const SizedBox(height: AppSpacing.lg),
                    _FooterLinks(theme: theme),
                  ],
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
        const AppLogo(size: 32),
        const SizedBox(width: AppSpacing.sm),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Autopilot Kitchen', style: Theme.of(context).textTheme.titleMedium),
            Text(
              '© ${DateTime.now().year} Autopilot Kitchen',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }
}

class _FooterLinks extends StatelessWidget {
  const _FooterLinks({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.lg,
      runSpacing: AppSpacing.sm,
      alignment: WrapAlignment.center,
      children: [
        _FooterLink(
          label: 'Privacy Policy',
          onTap: () => context.go(AppLinks.privacyPath),
        ),
        _FooterLink(
          label: 'Terms',
          onTap: () => context.go(AppLinks.termsPath),
        ),
        _FooterLink(
          label: 'Contact',
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => const ContactPage(),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _FooterLink extends StatefulWidget {
  const _FooterLink({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
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
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: _hovered ? AppColors.sageDark : AppColors.inkMuted,
                decoration: _hovered ? TextDecoration.underline : null,
              ),
        ),
      ),
    );
  }
}
