import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:room_meet_scheduler_flutter/widgets/calendar.dart';
import 'package:room_meet_scheduler_flutter/widgets/drawer.dart';

class Scheduler extends StatelessWidget {
  const Scheduler({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String selectedDay =
        DateFormat("EEEE, d 'de' MMMM", 'pt_BR').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            const Icon(
              Icons.calendar_month,
              color: Colors.black,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Planejador de reuniões',
                style: TextStyle(color: Colors.black),
              ),
            ),
            Tooltip(
              message: selectedDay,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(64, 231, 231, 231), // Background color
                  ),
                  side: MaterialStateProperty.all<BorderSide>(
                    const BorderSide(
                      color: Colors.black, // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                  overlayColor: MaterialStateProperty.all<Color?>(
                    const Color.fromARGB(
                        87, 222, 222, 222), // Overlay color when pressed
                  ),
                  splashFactory: NoSplash.splashFactory, // Remove splash effect
                ),
                child: const Text(
                  'Hoje',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      body: const CalendarDrawer(),
      drawer: const DrawerSide(),
    );
  }
}
