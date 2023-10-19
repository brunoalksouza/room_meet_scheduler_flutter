import 'package:flutter/material.dart';
import 'package:room_meet_scheduler_flutter/utils/colors/app_colors.dart';
import 'package:room_meet_scheduler_flutter/utils/functions/format_date.dart';
import 'package:room_meet_scheduler_flutter/widgets/calendar.dart';

// ignore: must_be_immutable
class Scheduler extends StatelessWidget {
  Scheduler({Key? key, required this.titleRoom}) : super(key: key);

  String titleRoom;

  @override
  Widget build(BuildContext context) {
    String selectedDate = formatDate(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorsPallete.primaryGreen,
        title: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Text(
                'Planejador de reuniões',
                style: TextStyle(color: ColorsPallete.primaryWhite),
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
                      color: ColorsPallete.primaryWhite, // Border color
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
            Text(
              titleRoom,
              style: const TextStyle(color: ColorsPallete.white),
            ),
          ],
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
              color: ColorsPallete.primaryWhite,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      body: const Calendar(),
      backgroundColor: const Color.fromARGB(255, 40, 2, 87),
    );
  }
}
