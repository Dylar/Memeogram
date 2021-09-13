import 'package:flutter_test/flutter_test.dart';
import 'package:memeogram/ui/screens/notes/notes_page.dart';

Future<void> swipeNoteToLeft(WidgetTester tester) async {
  await tester.drag(find.byType(NoteDismissible), const Offset(-500.0, 0.0));
  await tester.pumpAndSettle();
}
