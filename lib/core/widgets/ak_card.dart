import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';

class AkCard extends StatefulWidget {
  const AkCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(AppSpacing.lg),
    this.margin,
    this.hoverable = true,
  });

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final bool hoverable;

  @override
  State<AkCard> createState() => _AkCardState();
}

class _AkCardState extends State<AkCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final card = AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      margin: widget.margin ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        border: Border.all(
          color: _hovered && widget.hoverable
              ? AppColors.sage.withValues(alpha: 0.35)
              : AppColors.divider,
        ),
        boxShadow: _hovered && widget.hoverable
            ? [
                BoxShadow(
                  color: AppColors.ink.withValues(alpha: 0.06),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ]
            : null,
      ),
      child: Padding(padding: widget.padding, child: widget.child),
    );

    if (widget.onTap == null && !widget.hoverable) return card;

    return MouseRegion(
      onEnter: widget.hoverable ? (_) => setState(() => _hovered = true) : null,
      onExit: widget.hoverable ? (_) => setState(() => _hovered = false) : null,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          child: card,
        ),
      ),
    );
  }
}
