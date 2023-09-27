// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:room_meet_scheduler_flutter/models/corestore.dart';
import 'package:room_meet_scheduler_flutter/models/event.dart';
import 'package:room_meet_scheduler_flutter/utils/colors/app_colors.dart';
import 'package:room_meet_scheduler_flutter/utils/functions/format_date.dart';
import 'package:room_meet_scheduler_flutter/widgets/dropdown_hour_range.dart';

void openSchedulingConfirmation(
  BuildContext context, {
  required TextEditingController titleController,
  required TextEditingController descriptionController,
  required DateTime selectedDate,
  required Function(Event) addEvent,
}) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        scrollable: true,
        title: const Text('Agende um horário'),
        content: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              TextField(
                autofocus: true,
                controller: titleController,
                cursorColor: ColorsPallete.darkerGrey,
                decoration: const InputDecoration(
                  labelStyle: TextStyle(color: ColorsPallete.blackPurple),
                  labelText: 'Titulo',
                  focusedBorder: UnderlineInputBorder(),
                ),
              ),
              DropdownSelectHourRange(selectedDate: selectedDate),
              const SizedBox(height: 18),
              TextField(
                controller: descriptionController,
                maxLines: 3,
                cursorColor: ColorsPallete.darkerGrey,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: ColorsPallete.darkerGrey,
                      width: 2.0,
                    ),
                  ),
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  hintText: 'Integrantes, assuntos, etc.',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      ColorsPallete.primaryRed),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Text(
                    'Cancelar',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      ColorsPallete.primaryGreen),
                ),

                //#F44336
                onPressed: () async {
                  Event event = Event(
                    title: titleController.text,
                    description: descriptionController.text,
                    date: selectedDate,
                    formatedDate: formatDate(selectedDate),
                    start: getStartRange(
                        start ?? "6:30"), // Define getStartRange function
                    end: getEndRange(
                        end ?? "7:00"), // Define getEndRange function
                  );

                  await CoreStore.mongoService.addEvent(event);

                  Navigator.of(context).pop();
                },
                child: const Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Text(
                    'Agendar',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ], // Remove the semicolon here
      );
    },
  );
}
