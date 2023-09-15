// import 'package:flutter/material.dart';

// class SelectRangeHour extends StatelessWidget {
//   const SelectRangeHour({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Generate a list of hours from 7 AM to 7 PM
//     final List<String> hoursList = List.generate(13, (index) {
//       final hour = index + 7; // Start from 7 AM
//       final formattedHour =
//           hour < 10 ? '0$hour' : '$hour'; // Format single-digit hours
//       return '$formattedHour:00'; // Create a formatted hour string
//     });

//     return ListView.builder(
//       itemCount: hoursList.length,
//       itemBuilder: (context, index) {
//         final hour = hoursList[index];
//         return ListTile(
//           title: Text(hour),
//           onTap: () {
//             // Handle the selected hour here
//             Navigator.of(context)
//                 .pop(hour);
//           },
//         );
//       },
//     );
//   }
// }
