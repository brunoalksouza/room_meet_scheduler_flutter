import 'package:mongo_dart/mongo_dart.dart';
import 'package:room_meet_scheduler_flutter/interfaces/mongo_database_interface.dart';

class MongoDatabase implements Database<Db> {
  final String uriString;

  Db? con;

  Db? connection;

  bool _connected = false;

  late DateTime time;

  MongoDatabase({required this.uriString}) {
    time = DateTime.now();
  }

  @override
  Future<void> connect() async {
    try {
      connection = await Db.create(uriString);

      await connection!.open();
      _connected = true;
      time = DateTime.now().add(const Duration(minutes: 5));
    } catch (error) {
      print(error);
      _connected = false;
    }
  }

  @override
  Future<void> disconnect() async {
    if (_connected) {
      await connection?.close();
      _connected = false;
    }
  }

  @override
  Future<Db> getConnection() async {
    if (time.isBefore(DateTime.now()) || connection == null || !_connected) {
      await disconnect();
      await connect();
    }

    return connection!;
  }
}
