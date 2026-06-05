/// Abstraction for waitlist email capture.
abstract class WaitlistService {
  Future<WaitlistResult> subscribe({required String email});
}

class WaitlistResult {
  const WaitlistResult({required this.success, this.message});

  final bool success;
  final String? message;
}

const waitlistSuccessMessage =
    'You\'re on the list! 🎉\nWe\'ll let you know when Autopilot Kitchen is ready.';

const waitlistDuplicateMessage =
    'You\'re already on the list! We\'ll be in touch when Autopilot Kitchen is ready.';

/// Local fallback for tests and offline development.
class LocalWaitlistService implements WaitlistService {
  const LocalWaitlistService();

  @override
  Future<WaitlistResult> subscribe({required String email}) async {
    await Future<void>.delayed(const Duration(milliseconds: 600));

    if (!_isValidEmail(email)) {
      return const WaitlistResult(
        success: false,
        message: 'Please enter a valid email address.',
      );
    }

    return const WaitlistResult(
      success: true,
      message: waitlistSuccessMessage,
    );
  }

  bool _isValidEmail(String email) {
    final pattern = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    return pattern.hasMatch(email.trim());
  }
}
