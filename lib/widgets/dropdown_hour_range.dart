import 'package:flutter/material.dart';
import 'package:room_meet_scheduler_flutter/widgets/hour_dropdown_constructor.dart';

const List<String> hours = [
  '07:00',
  '07:30',
  '08:00',
  '08:30',
  '09:00',
  '09:30',
  '10:00',
  '10:30',
  '11:00',
  '11:30',
  '12:00',
  '12:30',
  '13:00',
  '13:30',
  '14:00',
  '14:30',
  '15:00',
  '15:30',
  '16:00',
  '16:30',
  '17:00',
  '17:30',
  '18:00',
  '18:30',
  '19:00',
];

class DropdownSelectHourRange extends StatefulWidget {
  const DropdownSelectHourRange({Key? key, required this.selectedDate})
      : super(key: key);
  final DateTime selectedDate;

  @override
  // ignore: library_private_types_in_public_api
  _DropdownSelectHourRangeState createState() =>
      _DropdownSelectHourRangeState();
}

String? start;
String? end;

class _DropdownSelectHourRangeState extends State<DropdownSelectHourRange> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.selectedDate.toString()),
        HourDropdownConstructor(
          value: start ?? hours.first,
          items: hours,
          onChanged: (value) {
            setState(() {
              start = value; // Update the start time
            });
          },
        ),
        const Text(' -  '),
        HourDropdownConstructor(
          value: end ?? hours.first,
          items: hours,
          onChanged: (value) {
            setState(() {
              end = value; // Update the end time
            });
          },
        ),
      ],
    );
  }
}
