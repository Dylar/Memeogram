import 'package:flutter/material.dart';
import 'package:memeogram/models/note.dart';
import 'package:memeogram/services/services.dart';
import 'package:memeogram/ui/widgets/scroll_list_view.dart';

class NotesPage extends StatefulWidget {
  NotesPage({Key key, this.title}) : super(key: key);

  static const String routeName = "/notesPage";

  final String title;

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  Note note;

  @override
  Widget build(BuildContext context) {
    final services = Services.of(context);
    return StreamBuilder<List<Note>>(
        stream: services.notesDataSource.watchNotes(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Container(
              child: Center(
                child: snapshot.hasData
                    ? _buildNoteItem(context, snapshot.data)
                    : CircularProgressIndicator(),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: _addNote,
              tooltip: 'Add Note',
              child: Icon(Icons.add),
            ),
          );
        });
  }

  Widget _buildNoteItem(BuildContext context, List<Note> data) {
    return ScrollListView<Note>(
      items: data,
      buildItemWidget: (_, note) => NoteListItem(note),
    );
  }

  void _addNote() {}
}

class NoteListItem extends StatelessWidget {
  const NoteListItem(this.note);

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'You have pushed the button this many times:',
        ),
        Text(
          '${note.title}',
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    );
  }
}
