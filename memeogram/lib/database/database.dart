import 'package:memeogram/models/note.dart';

class DatabaseOpenException implements Exception {}

class DatabaseClosedException implements Exception {}

class MemeogramDatabase {
  bool isOpen = false;
  List<Note> _dbNotes = [];

  void _isDatabaseOpen() {
    if (!isOpen) {
      throw DatabaseClosedException();
    }
  }

  Future<void> close() async {
    _isDatabaseOpen();
    isOpen = false;
  }

  Future<void> init() async {
    if (isOpen) {
      throw DatabaseOpenException();
    }
    isOpen = true;
  }

  Future<List<Note>> getNotes() async => _dbNotes;

  Future<void> upsertNote(Note note) async {
    _isDatabaseOpen();
    _dbNotes.add(note);
  }

  void deleteNote(Note note) {
    _isDatabaseOpen();
    _dbNotes.remove(note);
  }
}
