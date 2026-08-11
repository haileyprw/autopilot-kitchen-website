import 'app_links.dart';

abstract final class PrivacyPolicyContent {
  static const lastUpdated = 'August 10, 2026';

  static const sections = [
    (
      title: 'Overview',
      body:
          'Autopilot Kitchen ("we," "us") respects your privacy. This policy explains '
          'what we collect on our website and in the Autopilot Kitchen app, how we use it, '
          'and the choices you have.\n\n'
          'Our website is a marketing page and waitlist for the Autopilot Kitchen meal '
          'planning app. We keep things simple and only collect what we need.',
    ),
    (
      title: 'Information we collect',
      body:
          'When you join the waitlist, we collect:\n\n'
          '• Your email address\n'
          '• The date you signed up\n\n'
          'When you use the Autopilot Kitchen app, we may also store account and meal '
          'planning data you create, such as recipes, meal plans, grocery lists, and '
          'profile settings.\n\n'
          'We do not require an account to join the waitlist. We do not knowingly collect '
          'payment information, precise location, or other sensitive data on this website.',
    ),
    (
      title: 'How we use your information',
      body:
          'We use your waitlist email to:\n\n'
          '• Let you know when Autopilot Kitchen is available\n'
          '• Send occasional updates about the product launch\n\n'
          'In the app, we use your account data to provide meal planning features and '
          'sync your information across devices.\n\n'
          'We do not sell your email address. We do not use it for unrelated marketing.',
    ),
    (
      title: 'How we store your information',
      body:
          'Waitlist signups and app account data are stored in Google Firebase (Firestore '
          'and related Firebase services), a cloud platform operated by Google. Data is '
          'stored in the United States. Google processes this data on our behalf as a '
          'service provider.\n\n'
          'We take reasonable steps to protect your information, but no online service '
          'can guarantee complete security.',
    ),
    (
      title: 'Your choices',
      body:
          'You can ask us to remove your email from the waitlist at any time by contacting '
          'us at the address below. You can also unsubscribe from launch emails once they begin.\n\n'
          'If you have an Autopilot Kitchen app account, you have the right to delete your '
          'account at any time. Deleting your account permanently removes your account and '
          'all associated data we store for you, including recipes, meal plans, grocery '
          'lists, and profile information. You can delete your account from within the app, '
          'or by contacting us at the address below.',
    ),
    (
      title: 'Third-party services',
      body:
          'This website and the Autopilot Kitchen app use Firebase for data storage. '
          'Firebase is provided by Google and is subject to Google\'s privacy practices. '
          'We do not use advertising trackers or sell data to data brokers on this site.',
    ),
    (
      title: 'Children\'s privacy',
      body:
          'Autopilot Kitchen is not directed at children under 13. We do not knowingly '
          'collect personal information from children. If you believe a child has provided '
          'us their email or created an account, please contact us and we will delete it.',
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
          'Questions about this privacy policy, your waitlist data, or account deletion?\n\n'
          'Email: ${AppLinks.supportEmail}',
    ),
  ];
}
