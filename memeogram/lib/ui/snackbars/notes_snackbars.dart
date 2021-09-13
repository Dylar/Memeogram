import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showNoteDeletedSnackBar(BuildContext context, String title) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('$title removed')),
  );
}
