import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:memeogram/datasource/NotesDataSource.dart';
import 'package:memeogram/models/note.dart';
import 'package:provider/provider.dart';

class NotesViewModelProvider extends ChangeNotifierProvider<NotesViewModel> {
  NotesViewModelProvider(NotesDataSource notesDataSource)
      : super(create: (_) => NotesVM(notesDataSource));
}

abstract class NotesViewModel extends ChangeNotifier {
  Stream<List<Note>> get watchNotes;

  void dispose();

  Future<void> newNote();

  Future<void> removeNote(Note note);
}

class NotesVM extends NotesViewModel {
  NotesVM(this._notesDataSource);

  final NotesDataSource _notesDataSource;

  @override
  Stream<List<Note>> get watchNotes => _notesDataSource.watchNotes();

  @override
  Future<void> newNote() async {
    final note = Note(DateTime.now().toString());
    await _notesDataSource.addNewNote(note);
  }

  @override
  Future<void> removeNote(Note note) async {
    await _notesDataSource.removeNote(note);
  }
}
