///flutter drive --driver=test_driver/integration_test.dart --target=integration_test/first_test.dart -d web-server
///./chromedriver --port=4444

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:tester/main.dart' as app;

//import '../lib/dummy_data/dummy_user.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('end to end navigation test', (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();

      //starts at TopApp so find button to navigate
      final naviButton = find.byKey(Key('firstButton'));

      await tester.tap(naviButton);

      await tester.pumpAndSettle();
      //should be at MyApp which has column, TopApp does not
      expect(find.byType(SizedBox), findsOneWidget);
      //find find text go back
      expect(find.text('go back'), findsOneWidget);
      //confirmed on MyApp so look for the keys in card grid's cards
      const testKey = Key('theOne');

      //final nullKeyFinder = find.byKey(Key('pooKey'));
      final numKeyFinder = find.byKey(Key('1')); //can find
      final couponCardFinder = find.byKey(Key('couponCard'));
      final miscCardWidgetFinder = find.byKey(Key('3-cardWidget'));

      //final myKeyFinder = find.byKey(Key('theKey'));
      await tester.pumpAndSettle();
      expect(numKeyFinder, findsWidgets);
      expect(couponCardFinder, findsOneWidget);
      expect(miscCardWidgetFinder, findsOneWidget);
      expect(find.byKey(testKey), findsOneWidget);
      //await tester.pumpAndSettle();

      //expect(myKeyFinder, findsWidgets);
    });
  });
}
