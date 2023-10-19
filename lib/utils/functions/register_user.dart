import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:room_meet_scheduler_flutter/models/config.dart';

void registerUser(BuildContext context, emailController, passwordController,
    isNotValidate) async {
  if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
    var headers = {'Content-Type': 'application/json'};
    var data = json.encode(
        {"email": emailController.text, "password": passwordController.text});
    var dio = Dio();
    var response = await dio.request(
      registration,
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } else {
      print(response.statusMessage);
    }
  }
}
