import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization/main.dart';

void main() {
  // group('MyApp Tests', () {
    testWidgets('Locale change test', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Verify that the default locale is English.
      expect(find.text('Hello World'), findsOneWidget); // Assuming 'Hello World' is the text for default English locale

      // Tap the 'Change To Nepali' button to change the locale.
      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle(); // Wait for the widget to rebuild

      // Verify the locale has changed to Nepali.
      expect(find.text('नमस्ते संसार'), findsOneWidget); // Assuming 'नमस्ते संसार' is the text for Nepali locale
    });
  // });
}