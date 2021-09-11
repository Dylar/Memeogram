import 'package:flutter/material.dart';
import 'package:memeogram/datasource/NotesDataSource.dart';

class Services extends InheritedWidget {

  final NotesDataSource notesDataSource;

  const Services({this.notesDataSource, Key key, Widget child})
      : super(key: key, child: child);

  factory Services.init({
    NotesDataSource notesDataSource,
    Key key,
    Widget child,
  }) {
    return Services(
      notesDataSource: notesDataSource,
      key: key,
      child: child,
    );
  }

  static Services of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Services>();
  }

  @override
  bool updateShouldNotify(Services oldWidget) {
    return true;
  }
}
