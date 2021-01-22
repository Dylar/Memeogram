import 'package:flutter/material.dart';
import 'package:memeogram/database/database.dart';

class Services extends InheritedWidget {
  const Services({this.database, Key key, Widget child})
      : super(key: key, child: child);

  factory Services.init({
    Database database,
    Key key,
    Widget child,
  }) {
    return Services(
      database: database,
      key: key,
      child: child,
    );
  }

  static Services of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Services>();
  }

  final Database database;

  @override
  bool updateShouldNotify(Services oldWidget) {
    return true;
  }
}
