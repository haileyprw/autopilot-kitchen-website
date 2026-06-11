import 'app_links.dart';

abstract final class TermsOfServiceContent {
  static const lastUpdated = 'June 4, 2026';

  static const sections = [
    (
      title: 'Agreement',
      body:
          'By using the Autopilot Kitchen website or joining our waitlist, you agree to '
          'these Terms of Service. If you do not agree, please do not use the site.\n\n'
          'Autopilot Kitchen is currently in development. This website is a marketing page '
          'and waitlist — not the full app.',
    ),
    (
      title: 'The waitlist',
      body:
          'Joining the waitlist does not guarantee early access, a specific launch date, '
          'or any particular features. We may change launch plans, pricing, or availability '
          'before release.\n\n'
          'You agree to provide a valid email address and not sign up on behalf of someone '
          'else without their permission.',
    ),
    (
      title: 'Acceptable use',
      body:
          'You agree not to:\n\n'
          '• Submit false or misleading information\n'
          '• Attempt to access systems or data you are not authorized to use\n'
          '• Disrupt or interfere with the website\n'
          '• Use the site for unlawful purposes',
    ),
    (
      title: 'Intellectual property',
      body:
          'The Autopilot Kitchen name, logo, website content, and design are owned by '
          'Autopilot Kitchen. You may not copy, modify, or redistribute our content without '
          'written permission.',
    ),
    (
      title: 'Disclaimers',
      body:
          'This website and waitlist are provided "as is" without warranties of any kind. '
          'We do not promise that the site will be uninterrupted, error-free, or available '
          'at all times.\n\n'
          'Information on this site about upcoming features is subject to change.',
    ),
    (
      title: 'Limitation of liability',
      body:
          'To the fullest extent permitted by law, Autopilot Kitchen is not liable for any '
          'indirect, incidental, or consequential damages arising from your use of this '
          'website or waitlist.',
    ),
    (
      title: 'Changes',
      body:
          'We may update these terms from time to time. Continued use of the site after '
          'changes are posted means you accept the updated terms. The "Last updated" date '
          'at the top of this page will reflect any revisions.',
    ),
    (
      title: 'Contact',
      body:
          'Questions about these terms?\n\n'
          'Email: ${AppLinks.supportEmail}',
    ),
  ];
}
