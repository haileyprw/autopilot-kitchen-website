import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'app.dart';
import 'core/routing/app_router.dart';
import 'features/landing/services/firebase_waitlist_service.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final waitlistService = FirebaseWaitlistService();
  final router = createAppRouter(waitlistService: waitlistService);

  runApp(AutopilotKitchenWebsiteApp(router: router));
}
