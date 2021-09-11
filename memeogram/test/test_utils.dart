import 'package:memeogram/database/database.dart';
import 'package:memeogram/datasource/NotesDataSource.dart';
import 'package:memeogram/main.dart';
import 'package:mockito/mockito.dart';

class FakeDatabase extends Mock implements MemeogramDatabase {}

class FakeNotesDataSource extends Mock implements NotesDataSource {}

class TestUtils {
  static App loadTestApp({
    MemeogramDatabase database,
    NotesDataSource notesDataSource,
  }) {
    final db = database ?? MemeogramDatabase();
    return App.load(
      database: db,
      notesDataSource: notesDataSource ?? NotesDataSource(db),
    );
  }
}
