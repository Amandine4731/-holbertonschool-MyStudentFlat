import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:my_student_flat_4/main.dart';

class ComponentChoicesNumberOfPieces extends StatefulWidget {
  const ComponentChoicesNumberOfPieces({Key? key}) : super(key: key);

  @override
  _ComponentChoicesNumberOfPiecesState createState() =>
      _ComponentChoicesNumberOfPiecesState();
}

class _ComponentChoicesNumberOfPiecesState
    extends State<ComponentChoicesNumberOfPieces> {
  List<String> hobbyList = [
    '1',
    '2',
    '3',
    '4+',
  ];

  List<String> selectedHobby = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: _buildChoiceList(),
        ),
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
                color: isSelected ? colorGrey : Colors.white,
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
                  color: isSelected ? Colors.white : colorGrey,
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
