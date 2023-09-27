class Config {
  late String _dbUser;
  late String _dbPassword;
  late String _dbHost;
  late String _dbName;

  Config() {
    _dbUser = const String.fromEnvironment('DB_USER');
    _dbPassword = const String.fromEnvironment('DB_PASSWORD');
    _dbHost = const String.fromEnvironment('DB_HOST');
    _dbName = const String.fromEnvironment('DB_NAME');
  }

  String get dbUser => _dbUser;
  String get dbPassword => _dbPassword;
  String get dbHost => _dbHost;
  String get dbName => _dbName;
}
