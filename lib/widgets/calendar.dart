import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calendar Drawer'),
        ),
        body: CalendarDrawer(),
      ),
    );
  }
}

class CalendarDrawer extends StatefulWidget {
  const CalendarDrawer({
    super.key,
  });

  @override
  _CalendarDrawerState createState() => _CalendarDrawerState();
}

class _CalendarDrawerState extends State<CalendarDrawer> {
  //tem que pegar essa variavel e jogar ela no selectedday do scheduler
  DateTime _selectedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_BR');

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: TableCalendar(
          headerStyle: const HeaderStyle(),
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
          locale: 'pt_BR',
          calendarFormat: _calendarFormat,
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
        ),
      ),
    );
  }
}
