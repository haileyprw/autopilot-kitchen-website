import 'app_links.dart';

abstract final class PrivacyPolicyContent {
  static const lastUpdated = 'June 23, 2026';

  static const sections = [
    (
      title: 'Overview',
      body:
          'Autopilot Kitchen ("we," "us") respects your privacy. This policy explains '
          'what we collect on our website and in our iOS app, how we use it, and the '
          'choices you have.\n\n'
          'Our website is a marketing page and waitlist for the Autopilot Kitchen meal '
          'planning app. The mobile app lets you plan meals, save recipes, and generate '
          'grocery lists. We keep things simple and only collect what we need.',
    ),

    // —— Website (waitlist) ——

    (
      title: 'Website — Information we collect',
      body:
          'When you join the waitlist, we collect:\n\n'
          '• Your email address\n'
          '• The date you signed up\n\n'
          'We do not require an account to join the waitlist. We do not knowingly collect '
          'payment information, precise location, or other sensitive data on this website.',
    ),
    (
      title: 'Website — How we use your information',
      body:
          'We use your waitlist email to:\n\n'
          '• Let you know when Autopilot Kitchen is available\n'
          '• Send occasional updates about the product launch\n\n'
          'We do not sell your email address. We do not use it for unrelated marketing.',
    ),
    (
      title: 'Website — How we store your information',
      body:
          'Waitlist signups are stored in Google Firebase (Firestore), a cloud database '
          'operated by Google. Data is stored in the United States. Google processes this '
          'data on our behalf as a service provider.\n\n'
          'We take reasonable steps to protect your information, but no online service '
          'can guarantee complete security.',
    ),
    (
      title: 'Website — Your choices',
      body:
          'You can ask us to remove your email from the waitlist at any time by contacting '
          'us at the address below. You can also unsubscribe from launch emails once they begin.',
    ),
    (
      title: 'Website — Third-party services',
      body:
          'This website uses Firebase for waitlist storage. Firebase is provided by Google '
          'and is subject to Google\'s privacy practices. We do not use advertising trackers '
          'or sell data to data brokers on this site.',
    ),

    // —— Mobile app ——

    (
      title: 'Mobile app — Overview',
      body:
          'This section describes how we handle information when you use the Autopilot '
          'Kitchen iOS app. It supplements the website waitlist policy above.',
    ),
    (
      title: 'Mobile app — Information we collect',
      body:
          'Account information\n'
          '• Email address (if you sign up with email, Google, or Sign in with Apple)\n'
          '• Display name (if you provide one or sign in with Apple or Google)\n'
          '• A unique user ID assigned by Firebase Authentication (including anonymous '
          '"guest" accounts)\n\n'
          'Content you create\n'
          '• Recipes (titles, ingredients, instructions, notes, tags, and optional source URLs)\n'
          '• Meal plans (Week A, B, and C templates and calendar assignments)\n'
          '• Grocery lists and shopping progress\n'
          '• App preferences (for example, theme)\n\n'
          'Usage and diagnostics\n'
          '• App interaction events (for example, recipe created, grocery list generated) '
          'via Firebase Analytics\n'
          '• Crash and error reports via Firebase Crashlytics\n'
          '• Device and installation identifiers used by Firebase for analytics and crash '
          'reporting\n\n'
          'Onboarding preferences (dietary choices, goals) are stored on your device only '
          'and are not synced to our servers.\n\n'
          'We do not collect precise location, contacts, photos, payment information, '
          'HealthKit health data, or advertising identifiers for targeted ads.',
    ),
    (
      title: 'Mobile app — How we use your information',
      body:
          'We use your information to:\n\n'
          '• Create and manage your account\n'
          '• Store and sync your recipes, meal plans, and grocery lists\n'
          '• Import recipes from URLs you provide\n'
          '• Improve app stability and fix bugs (Crashlytics)\n'
          '• Understand how features are used so we can improve the app (Analytics)\n\n'
          'We do not sell your personal information. We do not use your data for third-party '
          'advertising or cross-app tracking.',
    ),
    (
      title: 'Mobile app — How we store your information',
      body:
          'App data is stored in Google Firebase (Authentication, Cloud Firestore, and Cloud '
          'Functions), operated by Google in the United States. Google processes this data on '
          'our behalf as a service provider.\n\n'
          'Data in Firestore is tied to your account and protected by security rules so only '
          'you can access your content.',
    ),
    (
      title: 'Mobile app — Third-party services',
      body:
          'The app uses the following services:\n\n'
          '• Firebase Authentication — sign-in (email, Apple, Google, guest) — Google\n'
          '• Cloud Firestore — store recipes, plans, and grocery data — Google\n'
          '• Cloud Functions — recipe URL import — Google\n'
          '• Firebase Analytics — usage analytics — Google\n'
          '• Firebase Crashlytics — crash reporting — Google\n'
          '• Firebase App Check — protect backend from abuse — Google\n\n'
          'These services are subject to Google\'s privacy practices '
          '(https://policies.google.com/privacy).\n\n'
          'Sign in with Apple and Google Sign-In are subject to Apple\'s and Google\'s '
          'respective privacy policies for authentication.',
    ),
    (
      title: 'Mobile app — Your choices',
      body:
          '• Guest mode: Use the app without an account; data is tied to an anonymous ID '
          'until you create an account.\n'
          '• Account deletion: Contact us to request deletion of your account and '
          'associated data.\n'
          '• Sign out: Ends your local session; your cloud data remains until you delete '
          'your account.\n'
          '• Analytics and Crashlytics: Collected in release builds, not during debug '
          'development on your device.',
    ),

    // —— Shared ——

    (
      title: 'Children\'s privacy',
      body:
          'Autopilot Kitchen is not directed at children under 13. We do not knowingly '
          'collect personal information from children on our website or in the app. If you '
          'believe a child has provided us their information, please contact us and we will '
          'delete it.',
    ),
    (
      title: 'Changes to this policy',
      body:
          'We may update this policy from time to time. When we do, we will revise the '
          '"Last updated" date at the top of this page.',
    ),
    (
      title: 'Contact',
      body:
          'Questions about this privacy policy, your waitlist data, or your app data?\n\n'
          'Email: ${AppLinks.supportEmail}',
    ),
  ];
}
