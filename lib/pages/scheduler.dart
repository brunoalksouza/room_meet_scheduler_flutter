import 'package:flutter/material.dart';
import 'package:room_meet_scheduler_flutter/utils/colors/app_colors.dart';
import 'package:room_meet_scheduler_flutter/utils/functions/format_date.dart';
import 'package:room_meet_scheduler_flutter/widgets/calendar.dart';

class Scheduler extends StatelessWidget {
  const Scheduler({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String selectedDate = formatDate(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorsPallete.primaryGreen,
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
              message: selectedDate,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      ColorsPallete.white // Background color
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
                    color: ColorsPallete.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.01),
            const Text(
              'Sala X',
              style: TextStyle(color: Colors.black),
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
      body: const Calendar(),
    );
  }
}
