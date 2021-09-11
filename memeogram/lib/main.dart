import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:memeogram/database/database.dart';
import 'package:memeogram/datasource/NotesDataSource.dart';
import 'package:memeogram/services/services.dart';

import 'memeogram_theme.dart';
import 'navigation/router.dart';

void main() {
  runApp(App.load());
}

class App extends StatelessWidget {
  const App({
    @required this.database,
    @required this.notesDataSource,
  })  : assert(database != null),
        assert(notesDataSource != null),
        super();

  factory App.load({
    MemeogramDatabase database,
    NotesDataSource notesDataSource,
  }) {
    return App(
      database: database ?? MemeogramDatabase(),
      notesDataSource: notesDataSource ?? NotesDataSource(database),
    );
  }

  final MemeogramDatabase database;
  final NotesDataSource notesDataSource;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
      lazy: false,
      create: (context) => AppBloc(),
      child: Services.init(
        notesDataSource: notesDataSource,
        child: MaterialApp(
          title: 'Memeogram',
          theme: memeogramTheme,
          onGenerateRoute: MemeogramRouter.generateRoute,
          navigatorObservers: [MemeogramRouter.routeObserver],
          supportedLocales: const [
            Locale('en'),
            Locale('de'),
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        ),
      ),
    );
  }
}

class AppBloc extends Cubit<AppState> {
  AppBloc({AppState state}) : super(state);
}

class AppState {}
