// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child ui.widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:memeogram/database/database.dart';

void main() {
  test('just testing', () async {
    final memeDatabase = MemeogramDatabase();

    expect(memeDatabase.isOpen, isFalse);
    await memeDatabase.init();
    expect(memeDatabase.isOpen, isTrue);
    await memeDatabase.close();
    expect(memeDatabase.isOpen, isFalse);
  });

  test('database test can not open twice - throws DatabaseOpenException',
      () async {
    final memeDatabase = MemeogramDatabase();
    expect(memeDatabase.isOpen, isFalse);
    await memeDatabase.init();
    expect(memeDatabase.isOpen, isTrue);
    expect(() async => await memeDatabase.init(),
        throwsA(isInstanceOf<DatabaseOpenException>()));

    expect(memeDatabase.isOpen, isTrue);
  });

  test('database test can not closed twice - throws DatabaseClosedException',
      () async {
    final memeDatabase = MemeogramDatabase();
    expect(memeDatabase.isOpen, isFalse);
    await memeDatabase.init();
    expect(memeDatabase.isOpen, isTrue);

    await memeDatabase.close();
    expect(memeDatabase.isOpen, isFalse);

    expect(() async => await memeDatabase.close(),
        throwsA(isInstanceOf<DatabaseClosedException>()));

    expect(memeDatabase.isOpen, isFalse);
  });
}
