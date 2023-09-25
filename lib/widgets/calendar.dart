import 'package:flutter/material.dart';
import 'package:room_meet_scheduler_flutter/models/event.dart';
import 'package:room_meet_scheduler_flutter/widgets/alert_dialog_scheduler.dart';
import 'package:room_meet_scheduler_flutter/widgets/events_list.dart';
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
  DateTime todayDate = DateTime.now();
  DateTime selectedDate = DateTime.now();

  final CalendarFormat _calendarFormat = CalendarFormat.month;

  List<Event> events = [];

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_BR');

    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              AlertDialogScheduler(
                selectedDate: selectedDate,
                events: events,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: TableCalendar(
              rowHeight: MediaQuery.of(context).size.height * 0.10,
              daysOfWeekHeight: MediaQuery.of(context).size.height * 0.08,
              calendarStyle: const CalendarStyle(
                defaultTextStyle: TextStyle(fontSize: 22),
                weekendTextStyle: TextStyle(fontSize: 22, color: Colors.grey),
                todayTextStyle: TextStyle(fontSize: 22, color: Colors.white),
                selectedTextStyle: TextStyle(fontSize: 22, color: Colors.white),
                outsideTextStyle: TextStyle(fontSize: 22, color: Colors.grey),
                tableBorder: TableBorder(
                  right: BorderSide(width: 0.5, color: Colors.grey),
                  left: BorderSide(width: 0.5, color: Colors.grey),
                  top: BorderSide(width: 1, color: Colors.grey),
                  bottom: BorderSide(width: 1, color: Colors.grey),
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
              onDaySelected: (selectedDay, focusedDay) {
                setState(
                  () {
                    if (selectedDay.weekday != DateTime.saturday &&
                        selectedDay.weekday != DateTime.sunday) {
                      selectedDate = selectedDay;
                    }
                  },
                );
              },
              daysOfWeekStyle: const DaysOfWeekStyle(
                decoration:
                    BoxDecoration(color: Color.fromARGB(60, 189, 189, 189)),
                weekdayStyle:
                    TextStyle(fontSize: 22), // Estilo dos dias da semana
                weekendStyle:
                    TextStyle(fontSize: 22), // Estilo dos fins de semana
              ),
              selectedDayPredicate: (day) {
                return isSameDay(selectedDate, day);
              },
              eventLoader: (day) {
                return events.where((event) {
                  return event.date.day == day.day &&
                      event.date.month == day.month &&
                      event.date.year == day.year;
                }).toList();
              },
            ),
          ),
        ),
      ],
    );
  }
}
