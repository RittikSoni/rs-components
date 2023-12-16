import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reusable_components/src/rs_dialog.dart';

void main() {
  testWidgets('RsDialog displays title and content',
      (WidgetTester tester) async {
    // Build a test widget.
    await tester.pumpWidget(MaterialApp(
      home: Builder(builder: (BuildContext context) {
        return ElevatedButton(
          onPressed: () {
            RsDialog.show(
              context,
              title: 'Test Title',
              content: 'Test Content',
            );
          },
          child: const Text('Show Dialog'),
        );
      }),
    ));

    // Tap the button to trigger the dialog.
    await tester.tap(find.text('Show Dialog'));
    await tester.pumpAndSettle();

    // Verify that the dialog is displayed with the correct title and content.
    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Content'), findsOneWidget);
  });

  testWidgets('RsDialog handles button callbacks', (WidgetTester tester) async {
    bool buttonPressed = false;

    // Build a test widget.
    await tester.pumpWidget(MaterialApp(
      home: Builder(builder: (BuildContext context) {
        return ElevatedButton(
          onPressed: () {
            RsDialog.show(
              context,
              title: 'Test Title',
              content: 'Test Content',
              buttons: [
                RsDialogButton(
                  text: 'OK',
                  onPressed: () {
                    buttonPressed = true;
                  },
                ),
              ],
            );
          },
          child: const Text('Show Dialog'),
        );
      }),
    ));

    // Tap the button to trigger the dialog.
    await tester.tap(find.text('Show Dialog'));
    await tester.pumpAndSettle();

    // Tap the dialog button to trigger its onPressed callback.
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    // Verify that the button's onPressed callback was called.
    expect(buttonPressed, isTrue);
  });
}
