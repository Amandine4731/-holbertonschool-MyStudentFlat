import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:my_student_flat_4/main.dart';

class ComponentChoicesLocalization extends StatefulWidget {
  const ComponentChoicesLocalization({Key? key}) : super(key: key);

  @override
  _ComponentChoicesLocalizationState createState() =>
      _ComponentChoicesLocalizationState();
}

class _ComponentChoicesLocalizationState
    extends State<ComponentChoicesLocalization> {
  List<String> hobbyList = [
    '31000',
    '31100',
    '31200',
    '31300',
    '31400',
    '31500',
  ];

  List<String> selectedHobby = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: _buildChoiceList(),
        ),
        /*SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: colorOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(
            'Apply Filter',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w900,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),*/
      ],
    );
  }

  List<Widget> _buildChoiceList() {
    List<Widget> choices = [];
    hobbyList.forEach((item) {
      bool isSelected = selectedHobby.contains(item);
      choices.add(
        GestureDetector(
          onTap: () {
            if (!selectedHobby.contains(item)) {
              if (selectedHobby.length < 5) {
                setState(() {
                  selectedHobby.add(item);
                });
              }
            } else {
              setState(() {
                selectedHobby.remove(item);
              });
            }
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : colorGrey,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: isSelected ? colorGrey : colorGrey,
                  width: 1,
                ),
              ),
              child: Text(
                item,
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w600,
                  color: isSelected ? colorGrey : Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      );
    });
    return choices;
  }
}
