// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:room_meet_scheduler_flutter/models/event.dart';
import 'package:room_meet_scheduler_flutter/repositories/mongo_repository.dart';

class MongoService {
  /// Method for updating a Sedex invoice in the database with the given data.
  Future<bool> addEvent(Event event) async {
    bool result = false;

    try {
      result = await MongoRepository.insert(event);
    } catch (error) {
      log("$error");
    }

    return result;
  }
}
