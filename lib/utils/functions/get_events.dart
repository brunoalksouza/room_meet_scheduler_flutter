// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:room_meet_scheduler_flutter/models/event.dart';

Future<List<Event>> getEvents(String date) async {
  var headers = {'Content-Type': 'application/json'};
  var data = json.encode({"date": date});
  var dio = Dio();
  var response = await dio.post(
    'http://localhost:3001/getevents',
    options: Options(
      headers: headers,
    ),
    data: data,
  );

  List<Event> events = [];

  if (response.statusCode == 200) {
    print(json.encode(response.data));

    events.addAll(
      (response.data["success"] as List)
          .map((object) => Event.fromMap(object))
          .toList(),
    );
  } else {
    print(response.statusMessage);
  }

  return events;
}
