// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:room_meet_scheduler_flutter/models/event.dart';
import 'package:room_meet_scheduler_flutter/utils/colors/app_colors.dart';
import 'package:room_meet_scheduler_flutter/utils/functions/format_date.dart';
import 'package:room_meet_scheduler_flutter/utils/functions/open_scheduling_confirmation.dart';

class AlertDialogScheduler extends StatelessWidget {
  final DateTime selectedDate;
  final List<Event> events;
  final void Function(Event) addEvent;

  AlertDialogScheduler({
    Key? key, // Use Key? key instead of super.key
    required this.selectedDate,
    required this.events,
    required this.addEvent,
  });

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(
          ColorsPallete.primaryGreen,
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        fixedSize: MaterialStateProperty.all<Size>(
          const Size(400.0, 40.0),
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(fontSize: 18),
        ),
        alignment: Alignment.center,
        minimumSize: MaterialStateProperty.all<Size>(
          const Size(400.0, 70.0),
        ),
      ),
      onPressed: () async {
        await openSchedulingConfirmation(
          context,
          addEvent: addEvent,
          descriptionController: descriptionController,
          titleController: titleController,
          selectedDate: selectedDate,
        );
      },
      child: Center(
        child: Text(
          'Agendar para ${formatDate(selectedDate)}',
          style: const TextStyle(
            color: ColorsPallete.white,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
