import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:room_meet_scheduler_flutter/models/corestore.dart';
import 'package:room_meet_scheduler_flutter/models/event.dart';

class MongoRepository {
  static MongoRepository? _instance;
  static Db? _db;

  MongoRepository._();

  static MongoRepository get instance {
    _instance ??= MongoRepository._();

    return _instance!;
  }

  /// Inserts a new Event into the database.
  static Future<bool> insert(Event event) async {
    bool isUpdated = false;

    try {
      _db = await CoreStore.database.getConnection();

      final collection = _db!.collection("room_scheduler_prod");

      final updateResult = await collection.insert(
        {
          "title": event.title,
          "description": event.description,
          "date": event.date,
          "formattedDate": event.formatedDate,
          "start": event.start,
          "end": event.end,
          "updatedAt": DateTime.now()
        },
      );

      isUpdated = updateResult["ok"] == 0.0;

      String message = (isUpdated)
          ? "Evento adicionado!"
          : "Falha na adição do evento: $updateResult";

      log(message);
    } on ConnectionException catch (error) {
      throw Exception(
          "Erro de conexão no banco de dados do MongoDB:\n$error\n. Cancelando operação...");
    } catch (error) {
      log("$error");
    }

    return isUpdated;
  }
}
