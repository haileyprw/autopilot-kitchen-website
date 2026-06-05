import 'package:flutter/material.dart';

import '../theme/app_spacing.dart';

enum AkButtonVariant { primary, secondary, ghost }

class AkButton extends StatelessWidget {
  const AkButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AkButtonVariant.primary,
    this.icon,
    this.isLoading = false,
    this.expand = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final AkButtonVariant variant;
  final IconData? icon;
  final bool isLoading;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final child = isLoading
        ? SizedBox(
            height: 22,
            width: 22,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: _foregroundColor(theme),
            ),
          )
        : Row(
            mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 20),
                const SizedBox(width: AppSpacing.sm),
              ],
              Flexible(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );

    final minSize = const Size(double.infinity, AppSpacing.minTapTarget);

    return switch (variant) {
      AkButtonVariant.primary => FilledButton(
          onPressed: isLoading ? null : onPressed,
          style: FilledButton.styleFrom(
            minimumSize: expand ? minSize : null,
            padding: EdgeInsets.symmetric(
              horizontal: expand ? AppSpacing.sm : AppSpacing.lg,
              vertical: AppSpacing.sm,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
            ),
          ),
          child: child,
        ),
      AkButtonVariant.secondary => FilledButton.tonal(
          onPressed: isLoading ? null : onPressed,
          style: FilledButton.styleFrom(
            minimumSize: expand ? minSize : null,
            backgroundColor: theme.colorScheme.secondary.withValues(alpha: 0.15),
            foregroundColor: theme.colorScheme.secondary,
            padding: EdgeInsets.symmetric(
              horizontal: expand ? AppSpacing.sm : AppSpacing.lg,
              vertical: AppSpacing.sm,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
            ),
          ),
          child: child,
        ),
      AkButtonVariant.ghost => TextButton(
          onPressed: isLoading ? null : onPressed,
          style: TextButton.styleFrom(
            minimumSize: expand ? minSize : null,
            padding: EdgeInsets.symmetric(
              horizontal: expand ? AppSpacing.sm : AppSpacing.lg,
              vertical: AppSpacing.sm,
            ),
          ),
          child: child,
        ),
    };
  }

  Color? _foregroundColor(ThemeData theme) {
    return switch (variant) {
      AkButtonVariant.primary => theme.colorScheme.onPrimary,
      AkButtonVariant.secondary => theme.colorScheme.secondary,
      AkButtonVariant.ghost => theme.colorScheme.primary,
    };
  }
}
