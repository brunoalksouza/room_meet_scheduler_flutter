abstract class Database<T extends Object> {
  Future<void> connect();

  Future<T> getConnection();

  Future<void> disconnect();
}
