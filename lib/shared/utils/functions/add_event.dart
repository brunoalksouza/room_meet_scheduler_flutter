// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:room_meet_scheduler_flutter/models/config.dart';
import 'package:room_meet_scheduler_flutter/models/corestore.dart';

Future<void> addEvent(
  BuildContext context,
  String title,
  String description,
  DateTime date,
) async {
  var headers = {'Content-Type': 'application/json'};
  var data = json.encode({
    "title": title,
    "description": description,
    "date": date.toString().split(" ").first,
    "start": CoreStore.start,
    "end": CoreStore.end
  });

  try {
    var dio = Dio();
    var response = await dio.request(
      addevent,
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
  } catch (e) {
    print(e);
  }
}
