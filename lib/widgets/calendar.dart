import 'package:flutter/material.dart';
import 'package:room_meet_scheduler_flutter/utils/event.dart';
import 'package:room_meet_scheduler_flutter/widgets/select_range_hour.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

class Calendar extends StatefulWidget {
  const Calendar({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _selectedDate = DateTime.now();
  final CalendarFormat _calendarFormat = CalendarFormat.month;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  Map<DateTime, List<Event>> events = {};

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_BR');

    return Column(
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: TableCalendar(
            calendarStyle: const CalendarStyle(
              defaultTextStyle: TextStyle(fontSize: 22),
              weekendTextStyle: TextStyle(fontSize: 22),
              todayTextStyle: TextStyle(fontSize: 22, color: Colors.white),
              selectedTextStyle: TextStyle(fontSize: 22, color: Colors.white),
              outsideTextStyle: TextStyle(fontSize: 22, color: Colors.grey),
              tableBorder: TableBorder(
                right: BorderSide(width: 0.5, color: Colors.grey),
                left: BorderSide(width: 0.5, color: Colors.grey),
                top: BorderSide(width: 0.5, color: Colors.grey),
                bottom: BorderSide(width: 0.5, color: Colors.grey),
                horizontalInside: BorderSide(width: 0.5, color: Colors.grey),
                verticalInside: BorderSide(width: 0.5, color: Colors.grey),
              ),
            ),
            firstDay: DateTime.now().copyWith(day: 1, month: 1),
            lastDay: DateTime.now().copyWith(day: 31, month: 12),
            focusedDay: DateTime.now(),
            locale: 'pt_BR',
            availableGestures: AvailableGestures.none,
            calendarFormat: _calendarFormat,
            headerStyle: const HeaderStyle(
              titleTextStyle: TextStyle(fontSize: 22),
              titleCentered: true,
              formatButtonVisible: false,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 240, 240, 240),
              ),
            ),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDate, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(
                () {
                  if (selectedDay.weekday != DateTime.saturday &&
                      selectedDay.weekday != DateTime.sunday) {
                    _selectedDate = selectedDay;
                  }
                },
              );
            },
            daysOfWeekStyle: const DaysOfWeekStyle(
              weekdayStyle:
                  TextStyle(fontSize: 22), // Estilo dos dias da semana
              weekendStyle:
                  TextStyle(fontSize: 22), // Estilo dos fins de semana
            ),
            rowHeight: MediaQuery.of(context).size.height * 0.13,
            daysOfWeekHeight: 70,
          ),
        ),
        ElevatedButton(
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
                          controller: _titleController,
                          decoration: const InputDecoration(
                            labelText: 'Titulo',
                          ),
                        ),
                        const SizedBox(height: 18),
                        const SelectRangeHour(),
                        const SizedBox(height: 18),
                        TextField(
                          controller: _descriptionController,
                          maxLines: 3,
                          decoration: InputDecoration(
                            floatingLabelAlignment:
                                FloatingLabelAlignment.start,
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
                    ElevatedButton(
                      onPressed: () {
                        events.addAll({
                          _selectedDate: [Event(_titleController.text)]
                        });
                        Navigator.of(context).pop();
                      },
                      child: const Text('Submit'),
                    )
                  ],
                );
              },
            );
          },
          child: const Icon(Icons.add),
        )
      ],
    );
  }
}
