import 'package:flutter/material.dart';

const List<String> hours = [
  '07:00',
  '08:00',
  '09:00',
  '10:00',
  '11:00',
  '12:00',
  '13:00',
  '14:00',
  '15:00',
  '16:00',
  '17:00',
  '18:00',
  '19:00'
];

class HourDropdown extends StatelessWidget {
  final String value;
  final List<String> items;
  final ValueChanged<String> onChanged;

  const HourDropdown(
      {super.key,
      required this.value,
      required this.items,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
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
  const DropdownSelectHourRange({Key? key}) : super(key: key);

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
    return Column(
      children: [
        const Text('Start Hour:'),
        HourDropdown(
          value: startHour,
          items: hours,
          onChanged: (value) {
            setState(() {
              startHour = value;
            });
          },
        ),
        const SizedBox(height: 20),
        const Text('End Hour:'),
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
