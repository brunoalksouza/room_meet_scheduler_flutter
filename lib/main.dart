import 'package:flutter/material.dart';
import 'package:room_meet_scheduler_flutter/pages/scheduler.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scheduler();
  }
}
