import 'package:flutter_test/flutter_test.dart';

import 'package:autopilot_kitchen_website/app.dart';
import 'package:autopilot_kitchen_website/features/landing/services/waitlist_service.dart';

void main() {
  testWidgets('Landing page renders hero headline', (tester) async {
    await tester.pumpWidget(
      const AutopilotKitchenWebsiteApp(
        waitlistService: LocalWaitlistService(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Plan once.\nEat well for months.'), findsOneWidget);
    expect(find.text('Join the Waitlist'), findsWidgets);
  });
}
