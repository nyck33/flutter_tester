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

      final myKeyFinder = find.byKey(Key('theKey'));
      await tester.pumpAndSettle();

      expect(myKeyFinder, findsWidgets);
    });
  });
}
