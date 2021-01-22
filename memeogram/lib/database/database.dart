abstract class Database {
  Future<bool> init();
  Future<bool> close();
}

class MemeogramDatabase extends Database {
  @override
  Future<bool> close() {
    // TODO: implement close
    throw UnimplementedError();
  }

  @override
  Future<bool> init() {
    // TODO: implement init
    throw UnimplementedError();
  }
}
