import 'package:flutter/material.dart';

import 'package:my_student_flat_MVP/main.dart';

class ComponentNavigationHomeAppbar extends StatefulWidget {
  const ComponentNavigationHomeAppbar({Key? key}) : super(key: key);

  @override
  _ComponentNavigationHomeAppbarState createState() =>
      _ComponentNavigationHomeAppbarState();
}

class _ComponentNavigationHomeAppbarState
    extends State<ComponentNavigationHomeAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: 15,
              top: 50,
              left: 10.0,
            ),
            child: Image.asset(
              'assets/elements/logoMyStudentFlatBeige.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          Spacer(),
        ],
      ),
      backgroundColor: colorOrange,
      elevation: 2,
    );
  }
}
