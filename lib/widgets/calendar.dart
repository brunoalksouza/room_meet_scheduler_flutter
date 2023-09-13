import 'package:flutter/material.dart';
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
  DateTime _selectedDay = DateTime.now();
  final CalendarFormat _calendarFormat = CalendarFormat.month;

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
              todayTextStyle: TextStyle(fontSize: 22),
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
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(
                () {
                  if (selectedDay.weekday != DateTime.saturday &&
                      selectedDay.weekday != DateTime.sunday) {
                    _selectedDay = selectedDay;
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
      ],
    );
  }
}
