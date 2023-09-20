import 'package:flutter/material.dart';
import 'package:room_meet_scheduler_flutter/models/event.dart';
import 'package:room_meet_scheduler_flutter/widgets/dropdown_hour_range.dart';

class AlertDialogScheduler extends StatelessWidget {
  final DateTime selectedDate;
  final List<Event> events;

  AlertDialogScheduler({
    super.key,
    required this.selectedDate,
    required this.events,
  });

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
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
                        hintText: 'Descrição',
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
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      events.addAll({
                        Event(
                          title: titleController.text,
                          description: descriptionController.text,
                          date: selectedDate,
                          start: "",
                          end: "",
                        ),
                      });
                      Navigator.of(context).pop();
                    },
                    child: const Text('Submit'),
                  ),
                )
              ],
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
