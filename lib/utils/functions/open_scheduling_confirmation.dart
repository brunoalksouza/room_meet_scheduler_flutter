import 'package:flutter/material.dart';
import 'package:room_meet_scheduler_flutter/models/event.dart';
import 'package:room_meet_scheduler_flutter/utils/functions/format_date.dart';
import 'package:room_meet_scheduler_flutter/widgets/dropdown_hour_range.dart';

void openSchedulingConfirmation(
  BuildContext context, {
  required TextEditingController titleController,
  required TextEditingController descriptionController,
  required DateTime selectedDate,
  required Function(Event) addEvent,
}) {
  showDialog(
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
                decoration: const InputDecoration(
                  labelText: 'Titulo',
                ),
              ),
              DropdownSelectHourRange(selectedDate: selectedDate),
              const SizedBox(height: 18),
              TextField(
                controller: descriptionController,
                maxLines: 3,
                decoration: InputDecoration(
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
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    'Cancelar',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
              ElevatedButton(
                onPressed: () {
                  addEvent(
                    Event(
                      title: titleController.text,
                      description: descriptionController.text,
                      date: selectedDate,
                      formatedDate: formatDate(selectedDate),
                      start: getStartRange(
                          start ?? "6:30"), // Define getStartRange function
                      end: getEndRange(
                          end ?? "7:00"), // Define getEndRange function
                    ),
                  );
                  Navigator.of(context).pop();
                },
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
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
