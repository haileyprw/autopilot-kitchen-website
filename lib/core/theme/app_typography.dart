import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract final class AppTypography {
  static TextTheme textTheme() {
    final base = GoogleFonts.dmSansTextTheme();
    const color = AppColors.ink;
    const muted = AppColors.inkMuted;

    return base.copyWith(
      displayLarge: base.displayLarge?.copyWith(
        fontWeight: FontWeight.w600,
        color: color,
        letterSpacing: -0.5,
        height: 1.1,
      ),
      displayMedium: base.displayMedium?.copyWith(
        fontWeight: FontWeight.w600,
        color: color,
        letterSpacing: -0.4,
        height: 1.15,
      ),
      headlineLarge: base.headlineLarge?.copyWith(
        fontWeight: FontWeight.w600,
        color: color,
        letterSpacing: -0.3,
        height: 1.2,
      ),
      headlineMedium: base.headlineMedium?.copyWith(
        fontWeight: FontWeight.w600,
        color: color,
        height: 1.25,
      ),
      titleLarge: base.titleLarge?.copyWith(
        fontWeight: FontWeight.w600,
        color: color,
      ),
      titleMedium: base.titleMedium?.copyWith(
        fontWeight: FontWeight.w500,
        color: color,
      ),
      bodyLarge: base.bodyLarge?.copyWith(
        color: color,
        height: 1.45,
      ),
      bodyMedium: base.bodyMedium?.copyWith(
        color: muted,
        height: 1.4,
      ),
      labelLarge: base.labelLarge?.copyWith(
        fontWeight: FontWeight.w600,
        color: color,
        letterSpacing: 0.2,
      ),
      labelMedium: base.labelMedium?.copyWith(
        fontWeight: FontWeight.w500,
        color: muted,
      ),
    );
  }
}
