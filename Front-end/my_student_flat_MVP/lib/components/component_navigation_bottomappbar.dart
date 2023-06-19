import 'package:flutter/material.dart';

import 'package:my_student_flat_MVP/main.dart';

import 'package:my_student_flat_MVP/pages/page_home1.dart';
import 'package:my_student_flat_MVP/pages/page_delete_account.dart';

class ComponentNavigationBottomappbar extends StatefulWidget {
  const ComponentNavigationBottomappbar({Key? key}) : super(key: key);

  @override
  _ComponentNavigationBottomappbarState createState() =>
      _ComponentNavigationBottomappbarState();
}

class _ComponentNavigationBottomappbarState
    extends State<ComponentNavigationBottomappbar> {
  bool isNotificationOn = false;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: colorOrange,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home_rounded),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PageHome1(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle_rounded),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PageAccountChanging(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
