import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:my_student_flat_4/main.dart';

import 'package:my_student_flat_4/pages/page_filters.dart';

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
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              children: [
                Text(
                  'APPARTEMENT DE REVE',
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.filter_list_rounded),
                  color: Colors.white,
                  iconSize: 25.0,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageFilters(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: colorOrange,
      elevation: 2,
    );
  }
}
