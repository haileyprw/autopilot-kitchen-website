import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/landing/presentation/landing_page.dart';
import 'features/landing/services/waitlist_service.dart';

class AutopilotKitchenWebsiteApp extends StatelessWidget {
  const AutopilotKitchenWebsiteApp({
    super.key,
    required this.waitlistService,
  });

  final WaitlistService waitlistService;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Autopilot Kitchen',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: LandingPage(waitlistService: waitlistService),
    );
  }
}
