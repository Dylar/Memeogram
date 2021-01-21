import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:memeogram/screens/home.dart';

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
    switch (settings.name) {
      case MyHomePage.routeName:
        return _navigateToHome(settings);
      default:
        return null;
    }
  }

  static MemeogramRoute _navigateToHome(RouteSettings settings) {
    return _wrapRoute(
        settings,
        Builder(
          builder: (context) => MyHomePage(
            title: AppLocalizations.of(context).helloWorld,
          ),
        ));
  }

  static MemeogramRoute _wrapRoute(RouteSettings settings, Widget widget) {
    return MemeogramRoute(
      settings: settings,
      builder: (context) => widget,
    );
  }
}
