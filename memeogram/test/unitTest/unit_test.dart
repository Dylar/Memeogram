// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../test_utils.dart';

void main() {
  test('just testing', () async {
    final mockDatabase = FakeDatabase();

    when(mockDatabase.init()).thenAnswer((_) async => true);
    when(mockDatabase.close()).thenAnswer((_) async => true);

    expect(await mockDatabase.init(), isTrue);
    expect(await mockDatabase.close(), isTrue);
  });
}
