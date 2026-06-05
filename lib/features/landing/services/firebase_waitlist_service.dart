import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'waitlist_service.dart';

class FirebaseWaitlistService implements WaitlistService {
  FirebaseWaitlistService({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  static const _waitlistCollection = 'waitlist';
  static const _statsDoc = 'waitlistStats/summary';

  @override
  Future<WaitlistResult> subscribe({required String email}) async {
    final normalized = email.trim().toLowerCase();

    if (!_isValidEmail(normalized)) {
      return const WaitlistResult(
        success: false,
        message: 'Please enter a valid email address.',
      );
    }

    try {
      final waitlistRef = _firestore.collection(_waitlistCollection).doc(normalized);

      // No read check — waitlist rules block reads. Create-only write;
      // duplicate emails hit update rule → permission-denied.
      await waitlistRef.set({
        'email': normalized,
        'createdAt': FieldValue.serverTimestamp(),
      });

      await _incrementSignupCount();

      return const WaitlistResult(
        success: true,
        message: waitlistSuccessMessage,
      );
    } on FirebaseException catch (error) {
      if (kDebugMode) {
        debugPrint('Waitlist FirebaseException: ${error.code} ${error.message}');
      }

      if (error.code == 'permission-denied') {
        return const WaitlistResult(
          success: true,
          message: waitlistDuplicateMessage,
        );
      }

      return WaitlistResult(
        success: false,
        message: _friendlyError(error),
      );
    } catch (error, stackTrace) {
      if (kDebugMode) {
        debugPrint('Waitlist error: $error');
        debugPrint('$stackTrace');
      }

      return const WaitlistResult(
        success: false,
        message: 'Something went wrong. Please try again in a moment.',
      );
    }
  }

  Future<void> _incrementSignupCount() async {
    try {
      await _firestore.doc(_statsDoc).set(
        {'count': FieldValue.increment(1)},
        SetOptions(merge: true),
      );
    } catch (error) {
      if (kDebugMode) {
        debugPrint('Waitlist stats update failed: $error');
      }
    }
  }

  bool _isValidEmail(String email) {
    final pattern = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    return pattern.hasMatch(email);
  }

  String _friendlyError(FirebaseException error) {
    return switch (error.code) {
      'unavailable' =>
        'Could not reach the server. Check your connection and try again.',
      'not-found' =>
        'Waitlist is not set up yet. Please try again soon.',
      _ => 'Something went wrong. Please try again.',
    };
  }
}
