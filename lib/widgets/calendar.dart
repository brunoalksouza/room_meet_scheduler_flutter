import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

class CalendarDrawer extends StatefulWidget {
  const CalendarDrawer({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CalendarDrawerState createState() => _CalendarDrawerState();
}

class _CalendarDrawerState extends State<CalendarDrawer> {
  //tem que pegar essa variavel e jogar ela no selectedday do scheduler
  DateTime _selectedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_BR');

    return SizedBox(
      height: MediaQuery.of(context).size.height, // Ocupa  a altura máxima
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: TableCalendar(
          calendarStyle: const CalendarStyle(
              defaultTextStyle: TextStyle(fontSize: 18),
              weekendTextStyle: TextStyle(fontSize: 18),
              todayTextStyle: TextStyle(fontSize: 18),
              selectedTextStyle: TextStyle(fontSize: 18, color: Colors.white),
              outsideTextStyle: TextStyle(fontSize: 18, color: Colors.grey)),
          firstDay: DateTime.now().copyWith(day: 1, month: 1),
          lastDay: DateTime.now().copyWith(day: 31, month: 12),
          focusedDay: DateTime.now(),
          locale: 'pt_BR',
          availableGestures: AvailableGestures.none,
          calendarFormat: _calendarFormat,
          headerStyle: const HeaderStyle(
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
          onFormatChanged: (format) {
            setState(
              () {
                _calendarFormat = format;
              },
            );
          },

          daysOfWeekStyle: const DaysOfWeekStyle(
            weekdayStyle: TextStyle(fontSize: 18), // Estilo dos dias da semana
            weekendStyle: TextStyle(fontSize: 18), // Estilo dos fins de semana
          ),
          rowHeight: MediaQuery.of(context).size.height *
              0.10, // Ocupa a altura máxima
        ),
      ),
    );
  }
}
