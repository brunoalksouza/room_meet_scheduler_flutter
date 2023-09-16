import 'package:flutter/material.dart';

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

class HourDropdown extends StatelessWidget {
  final String value;
  final List<String> items;
  final ValueChanged<String> onChanged;

  const HourDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      menuMaxHeight: 250,
      value: value,
      onChanged: (value) {},
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class DropdownSelectHourRange extends StatefulWidget {
  const DropdownSelectHourRange({Key? key, required this.selectedDay})
      : super(key: key);
  final DateTime selectedDay;

  @override
  // ignore: library_private_types_in_public_api
  _DropdownSelectHourRangeState createState() =>
      _DropdownSelectHourRangeState();
}

class _DropdownSelectHourRangeState extends State<DropdownSelectHourRange> {
  String startHour = hours.first;
  String endHour = hours.first;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.selectedDay.toString(),
        ),
        HourDropdown(
          value: startHour,
          items: hours,
          onChanged: (value) {
            setState(() {
              startHour = value!;
            });
          },
        ),
        const Text(' -  '),
        HourDropdown(
          value: endHour,
          items: hours,
          onChanged: (value) {
            setState(() {
              endHour = value;
            });
          },
        ),
      ],
    );
  }
}
