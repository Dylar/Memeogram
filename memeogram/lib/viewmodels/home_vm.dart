import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HomeViewModelProvider extends ChangeNotifierProvider<HomeViewModel> {
  HomeViewModelProvider() : super(create: (_) => HomeVM());
}

abstract class HomeViewModel extends ChangeNotifier {
  int get count;

  void incrementCounter();

  void dispose();
}

class HomeVM extends HomeViewModel {
  // final _streamController = StreamController<List<Note>>();

  int _counter = 0;

  @override
  int get count => _counter;

  @override
  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  @override
  void dispose() {
    // _streamController.close();
  }
}
