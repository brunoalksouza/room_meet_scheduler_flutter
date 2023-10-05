import 'package:room_meet_scheduler_flutter/models/config.dart';
import 'package:room_meet_scheduler_flutter/services/mongo_database_impl.dart';
import 'package:room_meet_scheduler_flutter/services/mongo_service.dart';

class CoreStore {
  static Config config = Config();

  static MongoDatabase database = MongoDatabase(
    uriString:
        "mongodb+srv://flutter:flutter_admin@fluttercluster.a8jm0fw.mongodb.net/room_meet_scheduller",
  );

  static MongoService mongoService = MongoService();
}
