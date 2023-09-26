import 'package:flutter/material.dart';
import 'package:room_meet_scheduler_flutter/widgets/calendar.dart';

class DrawerSide extends StatelessWidget {
  const DrawerSide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        child: Theme(
          data: ThemeData(
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[Calendar()],
          ),
        ),
      ),
    );
  }
}
