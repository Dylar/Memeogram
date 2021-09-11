import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:memeogram/ui/screens/home/home_page.dart';
import 'package:memeogram/ui/screens/notes/notes_page.dart';

abstract class AppRoute<T> extends Route<T> {
  String get appName;

  String get viewName;
}

class MemeogramRoute<T> extends MaterialPageRoute<T> implements AppRoute<T> {
  MemeogramRoute({
    @required WidgetBuilder builder,
    @required RouteSettings settings,
  })  : assert(builder != null),
        assert(settings != null),
        super(builder: builder, settings: settings);

  @override
  String get appName => 'Memeogram';

  @override
  String get viewName => settings.name;
}

class MemeogramRouter {
  static final RouteObserver<ModalRoute> routeObserver =
      RouteObserver<ModalRoute>();

  static AppRoute<dynamic> generateRoute(RouteSettings settings) {
    final navArgs = settings.arguments;
    WidgetBuilder builder;
    switch (settings.name) {
      case HomePage.routeName:
        builder = _navigateToHome;
        break;
      case NotesPage.routeName:
        builder = _navigateToNotes;
        break;
    }

    return _wrapRoute(settings, builder);
  }

  static MemeogramRoute _wrapRoute(
      RouteSettings settings, WidgetBuilder buildWidget) {
    return MemeogramRoute(
      settings: settings,
      builder: buildWidget,
    );
  }

  static Widget _navigateToHome(BuildContext context) {
    return HomePage(
      title: AppLocalizations.of(context).homoPageTitle,
    );
  }

  static Widget _navigateToNotes(BuildContext context) {
    return NotesPage(
      title: AppLocalizations.of(context).notesPageTitle,
    );
  }
}
