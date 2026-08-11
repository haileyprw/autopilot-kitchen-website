import 'package:go_router/go_router.dart';

import '../../features/landing/presentation/contact_page.dart';
import '../../features/landing/presentation/landing_page.dart';
import '../../features/landing/presentation/privacy_policy_page.dart';
import '../../features/landing/presentation/terms_of_service_page.dart';
import '../../features/landing/services/waitlist_service.dart';
import '../constants/app_links.dart';

GoRouter createAppRouter({required WaitlistService waitlistService}) {
  return GoRouter(
    initialLocation: AppLinks.homePath,
    routes: [
      GoRoute(
        path: AppLinks.homePath,
        builder: (context, state) => LandingPage(waitlistService: waitlistService),
      ),
      GoRoute(
        path: AppLinks.privacyPath,
        builder: (context, state) => const PrivacyPolicyPage(),
      ),
      GoRoute(
        path: AppLinks.termsPath,
        builder: (context, state) => const TermsOfServicePage(),
      ),
      GoRoute(
        path: AppLinks.contactPath,
        builder: (context, state) => const ContactPage(),
      ),
    ],
  );
}
