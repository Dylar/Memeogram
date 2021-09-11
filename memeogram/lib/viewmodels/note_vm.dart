import 'package:flutter/cupertino.dart';
import 'package:memeogram/models/note.dart';

abstract class NoteViewModel extends ChangeNotifier{
  Stream<Note> get watchNote;

  void dispose();
}
