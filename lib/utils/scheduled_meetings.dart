import 'package:flutter/material.dart';

class ScheduledMeetings extends StatelessWidget {
  const ScheduledMeetings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      flex: 1, // Define a largura do lado esquerdo
      child: Text('data'),
    );
  }
}
