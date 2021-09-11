import 'package:memeogram/database/database.dart';
import 'package:memeogram/models/note.dart';

class NotesDataSource {
  NotesDataSource(this.database);

  final MemeogramDatabase database;

  Stream<List<Note>> watchNotes() async* {
    while (database.isOpen) {
      yield [Note("Uno")];
      await Future.delayed(Duration(seconds: 5));
    }
  }
}
