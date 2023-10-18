import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:room_meet_scheduler_flutter/models/config.dart';

void loginUser(BuildContext context, TextEditingController emailController,
    TextEditingController passwordController, prefs) async {
  try {
    var headers = {'Content-Type': 'application/json'};
    var data = json.encode(
        {"email": emailController.text, "password": passwordController.text});
    var dio = Dio();
    var response = await dio.post(
      login,
      options: Options(
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
    print('error: $e');
  }
}