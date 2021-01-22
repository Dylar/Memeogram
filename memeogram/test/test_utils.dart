import 'package:memeogram/database/database.dart';
import 'package:memeogram/main.dart';
import 'package:mockito/mockito.dart';

class FakeDatabase extends Mock implements Database {}

class TestUtils {
  static App loadTestApp({Database database}) {
    return App.load(
      database: database ?? FakeDatabase(),
    );
  }
}
