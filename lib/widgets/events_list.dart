import 'package:flutter/material.dart';
import 'package:room_meet_scheduler_flutter/models/event.dart';
import 'package:room_meet_scheduler_flutter/utils/colors/app_colors.dart';
import 'package:room_meet_scheduler_flutter/widgets/event_item.dart';

// ignore: must_be_immutable
class EventsList extends StatefulWidget {
  List<Event> events;

  EventsList({Key? key, required this.events}) : super(key: key);

  @override
  State<EventsList> createState() => _EventsListState();
}

class _EventsListState extends State<EventsList> {
  @override
  Widget build(BuildContext context) {
    return (widget.events.isNotEmpty)
        ? SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: [
                for (Event event in widget.events) EventItem(event: event),
              ],
            ),
          )
        : SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: const Text(
              "Não há agendamentos para este dia.",
              style: TextStyle(color: ColorsPallete.white),
            ),
          );
  }
}