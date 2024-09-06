import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

void main() {
  testWidgets('renders basic structure and content SnackBar',
      (WidgetTester tester) async {
    const title = 'Test Title';
    const message = 'This is a test message.';

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: AwesomeSnackbarContent(
          title: title,
          message: message,
          contentType: ContentType.failure,
        ),
      ),
    ));

    // Verify title and message are displayed
    expect(find.text(title), findsOneWidget);
    expect(find.text(message), findsOneWidget);

    // Verify close button is displayed
    expect(find.byIcon(Icons.close), findsOneWidget);
  });

  testWidgets('renders basic structure and content in MaterialBanner',
      (WidgetTester tester) async {
    const title = 'Test Title';
    const message = 'This is a test message.';

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Builder(
          // Use Builder to get a context for ScaffoldMessenger
          builder: (context) {
            return ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showMaterialBanner(
                  MaterialBanner(
                    content: const AwesomeSnackbarContent(
                      title: title,
                      message: message,
                      contentType: ContentType.failure,
                      inMaterialBanner: true,
                    ),
                    backgroundColor: Colors.transparent,
                    forceActionsBelow: true,
                    elevation: 0.0,
                    actions: [
                      Container()
                    ], // You might need to provide actual actions here based on your app
                  ),
                );
              },
              child: const Text('Show MaterialBanner'),
            );
          },
        ),
      ),
    ));

    // Tap the button to show the MaterialBanner
    await tester.tap(find.text('Show MaterialBanner'));
    await tester.pumpAndSettle();

    // Verify title and message are displayed
    expect(find.text(title), findsOneWidget);
    expect(find.text(message), findsOneWidget);

    // Verify close button is displayed
    expect(find.byIcon(Icons.close), findsOneWidget);
  });

  testWidgets('closes snackbar when close button is tapped',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Builder(
          // Use Builder to get a context for ScaffoldMessenger
          builder: (context) {
            return ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: AwesomeSnackbarContent(
                      title: 'Test Title',
                      message: 'Test Message',
                      contentType: ContentType.failure,
                    ),
                    backgroundColor: Colors.transparent,
                    behavior: SnackBarBehavior.floating,
                    elevation: 0.0,
                  ),
                );
              },
              child: const Text('Show Snackbar'),
            );
          },
        ),
      ),
    ));

    // Tap the button to show the snackbar
    await tester.tap(find.text('Show Snackbar'));
    await tester.pumpAndSettle();

    // Verify the snackbar is visible
    expect(find.byType(AwesomeSnackbarContent), findsOneWidget);

    // Tap the close button
    await tester.tap(find.byIcon(Icons.close));
    await tester.pumpAndSettle();

    // Verify the snackbar is closed
    expect(find.byType(AwesomeSnackbarContent), findsNothing);
  });

  testWidgets('closes MaterialBanner when close button is tapped',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) {
            return ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showMaterialBanner(
                  MaterialBanner(
                    content: const AwesomeSnackbarContent(
                      title: 'Test Title',
                      message: 'Test Message',
                      contentType: ContentType.failure,
                      inMaterialBanner:
                          true, // Indicate it's in a MaterialBanner
                    ),
                    backgroundColor: Colors.transparent,
                    forceActionsBelow: true,
                    elevation: 0.0,
                    actions: [Container()], // Empty actions list for this test
                  ),
                );
              },
              child: const Text('Show MaterialBanner'),
            );
          },
        ),
      ),
    ));

    // Tap the button to show the MaterialBanner
    await tester.tap(find.text('Show MaterialBanner'));
    await tester.pumpAndSettle();

    // Verify the MaterialBanner is visible
    expect(find.byType(AwesomeSnackbarContent), findsOneWidget);

    // Tap the close button
    await tester.tap(find.byIcon(Icons.close));
    await tester.pumpAndSettle();

    // Verify the MaterialBanner is closed
    expect(find.byType(AwesomeSnackbarContent), findsNothing);
  });
}
