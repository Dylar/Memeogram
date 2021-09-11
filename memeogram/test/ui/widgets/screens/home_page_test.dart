// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child ui.widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:memeogram/ui/screens/home/home_page.dart';
import 'package:memeogram/ui/screens/notes/notes_page.dart';

import '../../../test_navigation.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await initNavigateToHome(tester);

    expect(find.byType(CounterPage), findsOneWidget);

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the 'Increment' button and trigger a frame.
    expect(find.byType(ElevatedButton), findsOneWidget);
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Render floating button - tap -> navigate to NotesPage',
      (WidgetTester tester) async {
    await initNavigateToHome(tester);

    expect(find.byIcon(Icons.record_voice_over), findsOneWidget);
    expect(find.byType(NotesPage), findsNothing);
    await tester.tap(find.byIcon(Icons.record_voice_over));
    await tester.pump();
    await tester.pump();
    expect(find.byType(NotesPage), findsOneWidget);
  });
}
