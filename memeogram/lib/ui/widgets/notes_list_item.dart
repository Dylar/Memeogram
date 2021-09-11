import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memeogram/models/note.dart';

class NoteListItem extends StatelessWidget {
  const NoteListItem(this.note);

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'This is note:',
          ),
          Text(
            '${note.title}',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
