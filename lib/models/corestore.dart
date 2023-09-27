import 'package:room_meet_scheduler_flutter/models/config.dart';
import 'package:room_meet_scheduler_flutter/services/mongo_database_impl.dart';
import 'package:room_meet_scheduler_flutter/services/mongo_service.dart';

class CoreStore {
  static Config config = Config();

  static MongoDatabase database = MongoDatabase(
    uriString:
        "${config.dbHost}://${config.dbUser}:${config.dbPassword}@cluster0.5vwuiip.mongodb.net/${config.dbName}",
  );

  static MongoService mongoService = MongoService();

  static String name = "";
  static String age = "";
}
