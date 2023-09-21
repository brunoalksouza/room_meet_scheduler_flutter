// import 'package:flutter/material.dart';

// class HourDropdownConstructor extends StatefulWidget {
//   final String value;
//   final List<String> items;
//   final ValueChanged<String> onChanged;

//   const HourDropdownConstructor({
//     super.key,
//     required this.value,
//     required this.items,
//     required this.onChanged,
//   });

//   @override
//   State<HourDropdownConstructor> createState() =>
//       _HourDropdownConstructorState();
// }


// class _HourDropdownConstructorState extends State<HourDropdownConstructor> {

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       menuMaxHeight: 250,
//       value: widget.value,
//       onChanged: (value) {
//         setState(() {
//           value = value;
//         });
//       },
//       items: widget.items.map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
// }
