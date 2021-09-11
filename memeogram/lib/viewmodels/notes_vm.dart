import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:memeogram/models/note.dart';
import 'package:provider/provider.dart';

class NotesViewModelProvider extends ChangeNotifierProvider<NotesViewModel> {
  NotesViewModelProvider() : super(create: (_) => NotesVM());
}

abstract class NotesViewModel extends ChangeNotifier {
  // Sink get inputMailText;
  Stream<List<Note>> get watchNotes;

  void dispose();
}

class NotesVM extends NotesViewModel {
  final _streamController = StreamController<List<Note>>();

  // @override
  // Sink get inputMailText => throw UnimplementedError();

  @override
  Stream<List<Note>> get watchNotes => _streamController.stream;

  @override
  void dispose() {
    _streamController.close();
  }
}
