import 'package:flutter/material.dart';
import 'package:memeogram/ui/screens/notes.dart';
import 'package:memeogram/viewmodels/home_vm.dart';
import 'package:provider/provider.dart';

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
            'You have pushed the button this many times:',
          ),
          Text(
            '${context.watch<HomeViewModel>().count}',
            style: Theme.of(context).textTheme.headline4,
          ),
          ElevatedButton(
            onPressed: context.read<HomeViewModel>().incrementCounter,
            child: Text('Increment'),
          )
        ],
      ),
    );
  }
}
