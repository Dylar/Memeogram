import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:memeogram/ui/screens/home/home_page.dart';
import 'package:memeogram/ui/screens/notes/notes_page.dart';

import 'test_utils.dart';

Future<void> initNavigateToHome(WidgetTester tester) async {
  // Build our app and trigger a frame.
  await tester.pumpWidget(TestUtils.loadTestApp());
  await tester.pump(Duration(seconds: 2));
  expect(find.byType(HomePage), findsOneWidget);
}

Future<void> initNavigateToNotes(WidgetTester tester) async {
  await initNavigateToHome(tester);

  await tester.tap(find.byIcon(Icons.record_voice_over));
  await tester.pumpAndSettle();
  expect(find.byType(NotesPage), findsOneWidget);
}
