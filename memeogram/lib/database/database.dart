class DatabaseOpenException implements Exception {}

class DatabaseClosedException implements Exception {}

abstract class Database {
  Future<void> init();

  Future<void> close();
}

class MemeogramDatabase extends Database {
  bool isOpen = false;

  @override
  Future<void> close() async {
    if (!isOpen) {
      throw DatabaseClosedException();
    }
    isOpen = false;
  }

  @override
  Future<void> init() async {
    if (isOpen) {
      throw DatabaseOpenException();
    }
    isOpen = true;
  }
}
