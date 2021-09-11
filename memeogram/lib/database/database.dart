class DatabaseOpenException implements Exception {}

class DatabaseClosedException implements Exception {}

class MemeogramDatabase {
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
