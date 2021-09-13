import 'package:flutter/material.dart';

class DismissDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Delete?'),
      content: Text('On confirm note will be deleted!'),
      actions: [
        TextButton(
          child: Text("Cancel"),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        TextButton(
          child: Text('Confirm'),
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    );
  }
}
