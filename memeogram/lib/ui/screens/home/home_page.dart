import 'package:flutter/material.dart';
import 'package:memeogram/ui/screens/notes/notes_page.dart';
import 'package:memeogram/ui/widgets/video_player.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);

  static const String routeName = "/";

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: CounterPage(),
      floatingActionButton: HomeFloatingButton(),
    );
  }
}

class HomeFloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.of(context).pushNamed(NotesPage.routeName),
      tooltip: "Record meme",
      child: Icon(Icons.record_voice_over),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Look a video',
          ),
          VideoWidget(),
        ],
      ),
    );
  }
}
