import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:room_meet_scheduler_flutter/models/config.dart';

void registerUser(BuildContext context, emailController, passwordController,
    isNotValidate) async {
  if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
    var regBody = {
      "email": emailController.text,
      "password": passwordController.text
    };

    var response = await http.post(
      Uri.parse(registration),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(regBody),
    );

    var jsonResponse = jsonDecode(response.body);

    print(
      jsonResponse['status'],
    );

    if (jsonResponse['status']) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } else {
      print('erro');
    }
    isNotValidate = false;
  } else {
    isNotValidate = true;
  }
}
