import 'package:flutter/material.dart';

class DrawerSide extends StatelessWidget {
  const DrawerSide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shadowColor: Colors.transparent,
      child: Theme(
        data: ThemeData(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [],
        ),
      ),
    );
  }
}
