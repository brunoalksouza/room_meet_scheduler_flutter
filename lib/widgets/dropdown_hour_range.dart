import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  '19:30',
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
  List<String> endDropdownItems = hours;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          DateFormat("EEEE, d 'de' MMMM - ", 'pt_BR')
              .format(widget.selectedDate),
        ),
        DropdownButton(
          menuMaxHeight: 250,
          value: start ?? hours.first,
          items: hours.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: ((value) {
            setState(
              () {
                start = value.toString();
                endDropdownItems =
                    hours.where((hour) => hour.compareTo(start!) >= 1).toList();
                getStartRange(start!);
              },
            );
            if (!endDropdownItems.contains(end)) {
              end = endDropdownItems.first;
            }
          }),
        ),
        const Text(' -  '),
        DropdownButton(
          menuMaxHeight: 250,
          value: end ?? hours[1],
          items: endDropdownItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: ((value) {
            setState(() {
              end = value.toString();
              getEndRange(end!);
            });
          }),
        ),
      ],
    );
  }
}

String getStartRange(String start) {
  return start;
}

String getEndRange(String end) {
  return end;
}
