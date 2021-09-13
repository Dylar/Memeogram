import 'package:flutter/material.dart';
import 'package:memeogram/models/note.dart';
import 'package:memeogram/ui/dialog/dismiss_dialog.dart';
import 'package:memeogram/ui/snackbars/notes_snackbars.dart';
import 'package:memeogram/ui/widgets/notes_list_item.dart';
import 'package:memeogram/ui/widgets/scroll_list_view.dart';
import 'package:memeogram/viewmodels/notes_vm.dart';
import 'package:provider/src/provider.dart';

import '../error_page.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({this.title});

  static const String routeName = "/notesPage";

  final String title;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Note>>(
        stream: context.watch<NotesViewModel>().watchNotes,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorPage(snapshot.error);
          }

          return Scaffold(
            appBar: AppBar(title: Text(title)),
            body: snapshot.connectionState == ConnectionState.active
                ? _buildNoteItem(context, snapshot.data ?? [])
                : Center(child: CircularProgressIndicator()),
            floatingActionButton: FloatingActionButton(
              onPressed: context.read<NotesViewModel>().newNote,
              tooltip: 'New Note',
              child: Icon(Icons.add),
            ),
          );
        });
  }

  Widget _buildNoteItem(BuildContext context, List<Note> data) {
    return Container(
      child: ScrollListView<Note>(
        items: data,
        emptyWidget: Center(
          child: Text("No notes found"),
        ),
        buildItemWidget: (_, note) => NoteDismissible(
          note: note,
          child: NoteListItem(note),
        ),
      ),
    );
  }
}

class NoteDismissible extends StatelessWidget {
  const NoteDismissible({
    @required this.note,
    @required this.child,
  });

  final Note note;
  final Widget child;

  bool isDeleteSwipe(DismissDirection direction) =>
      direction == DismissDirection.endToStart;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      child: child,
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) => confirmDismiss(context, direction),
      onDismissed: (direction) async {
        if (isDeleteSwipe(direction)) {
          await context.read<NotesViewModel>().removeNote(note);
          showNoteDeletedSnackBar(context, note.title);
        }
      },
    );
  }

  Future<bool> confirmDismiss(
    BuildContext context,
    DismissDirection direction,
  ) async =>
      isDeleteSwipe(direction) &&
      await showDialog<bool>(
        context: context,
        builder: (dialogCtx) => DismissDialog(),
      );
}
