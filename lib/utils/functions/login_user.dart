import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:room_meet_scheduler_flutter/models/config.dart';
import 'package:room_meet_scheduler_flutter/pages/room_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

void loginUser(
    BuildContext context, emailController, passwordController, prefs) async {
  if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
    var regBody = {
      "email": emailController.text,
      "password": passwordController.text
    };

    var response = await http.post(
      Uri.parse(login),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(regBody),
    );

    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse['status']) {
      var myToken = jsonResponse['token'];

      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RoomListPage(
            token: myToken,
          ),
        ),
      );
    } else {
      print('Something went wrong');
    }
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;

  const MyApp({Key? key, required this.prefs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: YourHomePage(prefs: prefs),
    );
  }
}

class YourHomePage extends StatelessWidget {
  final SharedPreferences prefs;

  const YourHomePage({Key? key, required this.prefs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App Title'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Call loginUser function with the initialized prefs
            loginUser(context, emailController, passwordController, prefs);
          },
          child: Text('Login'),
        ),
      ),
    );
  }
}

// Define emailController and passwordController here
var emailController = TextEditingController();
var passwordController = TextEditingController();
