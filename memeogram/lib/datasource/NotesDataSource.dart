import 'dart:async';

import 'package:memeogram/database/database.dart';
import 'package:memeogram/models/note.dart';

class NotesDataSource {
  NotesDataSource(this.database) : assert(database != null);

  final MemeogramDatabase database;

  final streamController = StreamController<List<Note>>();

  void dispose() {
    streamController.close();
  }

  Stream<List<Note>> watchNotes() {
    streamController.add([]);
    return streamController.stream;
  }

  Future<void> addNewNote(Note note) async {
    database.upsertNote(note);
    streamController.sink.add(await database.getNotes());
  }

  Future<void> removeNote(Note note) async {
    database.deleteNote(note);
    streamController.sink.add(await database.getNotes());
  }
}
