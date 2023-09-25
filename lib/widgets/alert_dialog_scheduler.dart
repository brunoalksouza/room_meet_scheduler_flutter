import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:room_meet_scheduler_flutter/models/event.dart';
import 'package:room_meet_scheduler_flutter/widgets/dropdown_hour_range.dart';

class AlertDialogScheduler extends StatelessWidget {
  final DateTime selectedDate;
  final List<Event> events;

  AlertDialogScheduler({
    Key? key, // Use Key? key instead of super.key
    required this.selectedDate,
    required this.events,
  });

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String formatDate(DateTime selectedDate) {
    return DateFormat("EEEE, d 'de' MMMM", 'pt_BR').format(selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(
          const Size(400.0, 40.0),
        ),
        textStyle:
            MaterialStateProperty.all<TextStyle>(const TextStyle(fontSize: 18)),
      ),
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
                        events.add(
                          Event(
                            title: titleController.text,
                            description: descriptionController.text,
                            date: selectedDate,
                            formatedDate: formatDate(selectedDate),
                            start: getStartRange(
                                start!), // Define getStartRange function
                            end: getEndRange(
                                end!), // Define getEndRange function
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
      },
      child: Text('Agendar para ${formatDate(selectedDate)}'),
    );
  }
}
