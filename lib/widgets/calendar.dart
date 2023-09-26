import 'package:flutter/material.dart';
import 'package:room_meet_scheduler_flutter/models/event.dart';
import 'package:room_meet_scheduler_flutter/utils/colors/app_colors.dart';
import 'package:room_meet_scheduler_flutter/utils/functions/format_date.dart';
import 'package:room_meet_scheduler_flutter/widgets/alert_dialog_scheduler.dart';
import 'package:room_meet_scheduler_flutter/widgets/events_list.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime todayDate = DateTime.now();
  DateTime selectedDate = DateTime.now();

  final CalendarFormat _calendarFormat = CalendarFormat.month;

  List<Event> events = [
    Event(
        title: "title",
        description: "description",
        date: DateTime.now(),
        formatedDate: formatDate(DateTime.now()),
        start: "07:00",
        end: "8:00"),
    Event(
        title: "title",
        description: "description",
        date: DateTime.now(),
        formatedDate: formatDate(DateTime.now()),
        start: "07:00",
        end: "8:00"),
    Event(
        title: "title",
        description: "description",
        date: DateTime.now(),
        formatedDate: formatDate(DateTime.now()),
        start: "07:00",
        end: "8:00"),
    Event(
        title: "title",
        description: "description",
        date: DateTime.now(),
        formatedDate: formatDate(DateTime.now()),
        start: "07:00",
        end: "8:00"),
    Event(
        title: "title",
        description: "description",
        date: DateTime.now(),
        formatedDate: formatDate(DateTime.now()),
        start: "07:00",
        end: "8:00"),
    Event(
        title: "title",
        description: "description",
        date: DateTime.now(),
        formatedDate: formatDate(DateTime.now()),
        start: "07:00",
        end: "8:00"),
    Event(
        title: "title",
        description: "description",
        date: DateTime.now(),
        formatedDate: formatDate(DateTime.now()),
        start: "07:00",
        end: "8:00"),
    Event(
        title: "title",
        description: "description",
        date: DateTime.now(),
        formatedDate: formatDate(DateTime.now()),
        start: "07:00",
        end: "8:00"),
    Event(
        title: "title",
        description: "description",
        date: DateTime.now(),
        formatedDate: formatDate(DateTime.now()),
        start: "07:00",
        end: "8:00"),
    Event(
        title: "title",
        description: "description",
        date: DateTime.now(),
        formatedDate: formatDate(DateTime.now()),
        start: "07:00",
        end: "8:00"),
    Event(
        title: "title",
        description: "description",
        date: DateTime.now(),
        formatedDate: formatDate(DateTime.now()),
        start: "07:00",
        end: "8:00"),
    Event(
        title: "title",
        description: "description",
        date: DateTime.now(),
        formatedDate: formatDate(DateTime.now()),
        start: "07:00",
        end: "8:00"),
    Event(
        title: "title",
        description: "description",
        date: DateTime.now(),
        formatedDate: formatDate(DateTime.now()),
        start: "07:00",
        end: "8:00"),
  ];

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_BR');

    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                    'Agendamentos',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: ColorsPallete.primaryWhite),
                  ),
                ),
                EventsList(events: events),
                const SizedBox(
                  height: 20,
                ),
                AlertDialogScheduler(
                  selectedDate: selectedDate,
                  events: events,
                  addEvent: addEvent,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width * 0.02,
              right: MediaQuery.of(context).size.width * 0.02,
              bottom: MediaQuery.of(context).size.width * 0.02,
            ),
            child: Container(
              decoration: const BoxDecoration(
                color: ColorsPallete.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: TableCalendar(
                    rowHeight: MediaQuery.of(context).size.height * 0.10,
                    daysOfWeekHeight: MediaQuery.of(context).size.height * 0.08,
                    calendarStyle: const CalendarStyle(
                      defaultTextStyle: TextStyle(fontSize: 22),
                      weekendTextStyle:
                          TextStyle(fontSize: 22, color: Colors.grey),
                      todayTextStyle:
                          TextStyle(fontSize: 22, color: Colors.white),
                      selectedTextStyle:
                          TextStyle(fontSize: 22, color: Colors.white),
                      outsideTextStyle:
                          TextStyle(fontSize: 22, color: Colors.grey),
                      tableBorder: TableBorder(
                        right: BorderSide(width: 0.5, color: Colors.grey),
                        left: BorderSide(width: 0.5, color: Colors.grey),
                        top: BorderSide(width: 1, color: Colors.grey),
                        bottom: BorderSide(width: 1, color: Colors.grey),
                        horizontalInside:
                            BorderSide(width: 0.5, color: Colors.grey),
                        verticalInside:
                            BorderSide(width: 0.5, color: Colors.grey),
                      ),
                    ),
                    firstDay: DateTime.now().copyWith(day: 1, month: 1),
                    lastDay: DateTime.now().copyWith(day: 31, month: 12),
                    focusedDay: DateTime.now(),
                    locale: 'pt_BR',
                    availableGestures: AvailableGestures.none,
                    calendarFormat: _calendarFormat,
                    headerStyle: const HeaderStyle(
                      rightChevronIcon: Icon(
                        Icons.chevron_right,
                        color: ColorsPallete.white,
                      ),
                      leftChevronIcon: Icon(
                        Icons.chevron_left,
                        color: ColorsPallete.white,
                      ),
                      titleTextStyle: TextStyle(
                          fontSize: 22, color: ColorsPallete.primaryWhite),
                      titleCentered: true,
                      formatButtonVisible: false,
                      decoration: BoxDecoration(
                        color: ColorsPallete.primaryGreen,
                      ),
                    ),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(
                        () {
                          if (selectedDay.weekday != DateTime.saturday &&
                              selectedDay.weekday != DateTime.sunday &&
                              selectedDay.isAfter(
                                todayDate.subtract(const Duration(days: 1)),
                              )) {
                            selectedDate = selectedDay;
                          }
                        },
                      );
                    },
                    daysOfWeekStyle: const DaysOfWeekStyle(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(57, 201, 201, 201),
                      ),
                      weekdayStyle: TextStyle(fontSize: 22),
                      weekendStyle: TextStyle(fontSize: 22),
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
            ),
          ),
        ),
      ],
    );
  }

  void addEvent(Event event) {
    setState(() {
      events.add(event);
    });
  }
}
