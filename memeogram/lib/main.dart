import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:memeogram/database/database.dart';
import 'package:memeogram/datasource/NotesDataSource.dart';
import 'package:memeogram/services/services.dart';
import 'package:memeogram/ui/screens/error_page.dart';
import 'package:memeogram/viewmodels/home_vm.dart';
import 'package:memeogram/viewmodels/notes_vm.dart';
import 'package:provider/provider.dart';

import 'memeogram_theme.dart';
import 'navigation/router.dart';
import 'ui/screens/loading_page.dart';

void main() {
  runApp(App.load());
}

class AppProviders extends StatelessWidget {
  const AppProviders({@required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final services = Services.of(context);
    return MultiProvider(
      providers: [
        HomeViewModelProvider(),
        NotesViewModelProvider(services.notesDataSource),
      ],
      child: child,
    );
  }
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
    final db = database ?? MemeogramDatabase();
    return App(
      database: db,
      notesDataSource: notesDataSource ?? NotesDataSource(db),
    );
  }

  final MemeogramDatabase database;
  final NotesDataSource notesDataSource;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: initDB(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Directionality(
              textDirection: TextDirection.ltr,
              child: Center(child: ErrorPage(snapshot.error.toString())),
            );
          }

          if (snapshot.connectionState != ConnectionState.done) {
            return LoadingStartPage();
          }

          return Services.init(
            notesDataSource: notesDataSource,
            child: AppProviders(
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
        });
  }

  Future<void> initDB() async {
    await Future.delayed(Duration(seconds: 2));
    return database.isOpen ? Future.value() : database.init();
  }
}
