import 'package:flutter/material.dart';

import 'package:my_student_flat_4/main.dart';

class ComponentNavigationAppbar extends StatefulWidget {
  const ComponentNavigationAppbar({Key? key}) : super(key: key);

  @override
  _ComponentNavigationAppbarState createState() =>
      _ComponentNavigationAppbarState();
}

class _ComponentNavigationAppbarState extends State<ComponentNavigationAppbar> {
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
        ],
      ),
      backgroundColor: colorOrange,
      elevation: 2,
    );
  }
}
