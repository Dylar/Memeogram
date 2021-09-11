import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage(this.error);

  final String error;

  @override
  Widget build(BuildContext context) => Container(child: Text(error));
}
