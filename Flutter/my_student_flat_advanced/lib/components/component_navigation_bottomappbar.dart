import 'package:flutter/material.dart';

import 'package:my_student_flat_4/main.dart';

import 'package:my_student_flat_4/pages/page_home.dart';

import 'package:my_student_flat_4/pages/page_account_changing.dart';

class ComponentNavigationBottomappbar extends StatefulWidget {
  const ComponentNavigationBottomappbar({Key? key}) : super(key: key);

  @override
  _ComponentNavigationBottomappbarState createState() =>
      _ComponentNavigationBottomappbarState();
}

class _ComponentNavigationBottomappbarState
    extends State<ComponentNavigationBottomappbar> {
  bool isNotificationOn = false;
  // Ajouter un éta
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: colorOrange,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(
              isNotificationOn
                  ? Icons.notifications
                  : Icons
                      .notifications_off, // Changer l'icône de notification en fonction de l'état actuel de isNotificationOn
            ),
            color: Colors.white,
            onPressed: () {
              setState(() {
                // Mettre à jour l'état de isNotificationOn lorsque l'utilisateur clique sur l'icône de notification
                isNotificationOn = !isNotificationOn;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.home_rounded),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PageHome(),
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
