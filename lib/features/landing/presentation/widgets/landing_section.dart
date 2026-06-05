import 'package:flutter/material.dart';

import '../../../../core/constants/landing_breakpoints.dart';
import '../../../../core/theme/app_spacing.dart';

class LandingSection extends StatelessWidget {
  const LandingSection({
    super.key,
    required this.child,
    this.backgroundColor,
    this.paddingVertical = AppSpacing.sectionY,
    this.id,
  });

  final Widget child;
  final Color? backgroundColor;
  final double paddingVertical;
  final String? id;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: id != null ? Key(id!) : null,
      width: double.infinity,
      color: backgroundColor,
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: paddingVertical,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: LandingBreakpoints.maxContentWidth,
          ),
          child: child,
        ),
      ),
    );
  }
}
