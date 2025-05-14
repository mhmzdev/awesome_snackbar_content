import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:example/main.dart';

void main() {
  group('AwesomeSnackBar Example Tests', () {
    testWidgets('App should render with two buttons',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Verify that both buttons are present
      expect(find.text('Show Awesome SnackBar'), findsOneWidget);
      expect(find.text('Show Awesome Material Banner'), findsOneWidget);
    });

    testWidgets('Tapping SnackBar button shows snackbar with correct content',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Tap the snackbar button
      await tester.tap(find.text('Show Awesome SnackBar'));
      await tester.pump(); // Start the animation
      await tester
          .pump(const Duration(seconds: 1)); // Pump until animation ends

      // Verify snackbar content
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.byType(AwesomeSnackbarContent), findsOneWidget);
      expect(find.text('On Snap!'), findsOneWidget);
      expect(
          find.text(
              'This is an example error message that will be shown in the body of snackbar!'),
          findsOneWidget);

      // Verify snackbar properties
      final SnackBar snackBar = tester.widget(find.byType(SnackBar));
      expect(snackBar.elevation, 0);
      expect(snackBar.behavior, SnackBarBehavior.floating);
      expect(snackBar.backgroundColor, Colors.transparent);

      // Verify AwesomeSnackbarContent properties
      final AwesomeSnackbarContent content =
          tester.widget(find.byType(AwesomeSnackbarContent));
      expect(content.contentType, ContentType.failure);
    });

    testWidgets(
        'Tapping Material Banner button shows banner with correct content',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Tap the material banner button
      await tester.tap(find.text('Show Awesome Material Banner'));
      await tester.pump(); // Start the animation
      await tester
          .pump(const Duration(seconds: 1)); // Pump until animation ends

      // Verify material banner content
      expect(find.byType(MaterialBanner), findsOneWidget);
      expect(find.byType(AwesomeSnackbarContent), findsOneWidget);
      expect(find.text('Oh Hey!!'), findsOneWidget);
      expect(
          find.text(
              'This is an example error message that will be shown in the body of materialBanner!'),
          findsOneWidget);

      // Verify material banner properties
      final MaterialBanner banner = tester.widget(find.byType(MaterialBanner));
      expect(banner.elevation, 0);
      expect(banner.backgroundColor, Colors.transparent);
      expect(banner.forceActionsBelow, true);

      // Verify AwesomeSnackbarContent properties
      final AwesomeSnackbarContent content =
          tester.widget(find.byType(AwesomeSnackbarContent));
      expect(content.contentType, ContentType.success);
      expect(content.inMaterialBanner, true);
    });
  });
}
