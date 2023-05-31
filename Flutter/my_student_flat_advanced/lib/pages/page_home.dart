import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:my_student_flat_4/main.dart';

import 'package:my_student_flat_4/components/component_navigation_home_appbar.dart';
import 'package:my_student_flat_4/components/component_navigation_bottomappbar.dart';
import 'package:my_student_flat_4/components/component_card_flat.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBeige,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            90), // Définir la hauteur de la barre d'app personnalisée
        child: ComponentNavigationHomeAppbar(),
      ),
      bottomNavigationBar: ComponentNavigationBottomappbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(
                bottom: 0,
                top: 0,
                right: 10,
                left: 10,
              ),
              child: Column(
                children: [
                  DropdownButton<String>(
                    value: selectedValue, // Définir la valeur sélectionnée
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: colorOrange, // Changer la couleur ici
                    ),
                    items: <String>[
                      'Les plus récents',
                      'Prix par ordre croissant',
                      'Prix par ordre décroissant',
                      'Surface par ordre croissant',
                      'Surface par ordre décroissant',
                      'Mes favoris',
                    ].map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: GoogleFonts.lato(
                            color: colorOrange,
                            fontWeight: FontWeight.w700,
                            fontSize: 16, // Changer la couleur du texte ici
                          ),
                        ),
                      );
                    }).toList(),
                    underline: Container(
                      height: 0.5,
                      color: colorOrange, // Changer la couleur du trait ici
                    ),
                    onChanged: (String? newValue) {
                      setState(
                        () {
                          selectedValue =
                              newValue; // Mettre à jour la valeur sélectionnée
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            ComponentCardFlat(),
          ],
        ),
      ),
    );
  }
}
