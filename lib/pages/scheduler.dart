import 'package:flutter/material.dart';

class Scheduler extends StatelessWidget {
  const Scheduler({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: const Drawer(
          child: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          // elevation: 0,
          title: const Text(
            'Planejador de reuniões',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
