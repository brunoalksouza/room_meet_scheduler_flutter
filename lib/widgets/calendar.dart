import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

class CalendarDrawer extends StatelessWidget {
  const CalendarDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_BR');

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TableCalendar(
        headerStyle: HeaderStyle(),
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: DateTime.now(),
        locale: 'pt_BR',
      ),
    );
  }
}
