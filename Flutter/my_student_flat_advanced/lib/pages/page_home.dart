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
  int selectedContainerIndex = -1;
  String? selectedValue;
  bool showFavorites = false;

  List<ComponentCardFlat> myFavorites = [];

  void initState() {
    super.initState();
    selectedContainerIndex = 0; // Initialisation du premier conteneur activé
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBeige,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            70), // Définir la hauteur de la barre d'app personnalisée
        child: ComponentNavigationHomeAppbar(),
      ),
      bottomNavigationBar: ComponentNavigationBottomappbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 0),
              padding: EdgeInsets.only(
                bottom: 0,
                top: 0,
                right: 10,
                left: 10,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedContainerIndex = 0;
                              showFavorites = false;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            height: 50,
                            width: MediaQuery.of(context).size.width / 2.1,
                            decoration: BoxDecoration(
                                color: selectedContainerIndex == 0
                                    ? colorOrange
                                    : Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: const Radius.circular(10.0),
                                  bottomRight: const Radius.circular(10.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 0,
                                    blurRadius: 5,
                                    offset: Offset(1, 1),
                                  ),
                                ]),
                            child: Align(
                              alignment: Alignment
                                  .center, // Align however you like (i.e .centerRight, centerLeft)
                              child: Text(
                                'Toutes les annonces',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w400,
                                  color: selectedContainerIndex == 0
                                      ? Colors.white
                                      : colorOrange,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedContainerIndex = 1;
                              showFavorites = true;
                            });
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 2.1,
                            decoration: BoxDecoration(
                                color: selectedContainerIndex == 1
                                    ? colorOrange
                                    : Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: const Radius.circular(10.0),
                                  bottomRight: const Radius.circular(10.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 0,
                                    blurRadius: 5,
                                    offset: Offset(1, 1),
                                  ),
                                ]),
                            child: Align(
                              alignment: Alignment
                                  .center, // Align however you like (i.e .centerRight, centerLeft)
                              child: Text(
                                'Mes favoris',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w400,
                                  color: selectedContainerIndex == 1
                                      ? Colors.white
                                      : colorOrange,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
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
            ComponentCardFlat()
            /*Column(
              children: [
                if (showFavorites && myFavorites.length >= 1)
                  myFavorites[0]
                else if (!showFavorites)
                  ComponentCardFlat()

                // Ajouter ici la logique pour afficher uniquement les cartes avec l'icône de favori activée
                // Vous pouvez utiliser un ListView.builder ou une autre méthode de filtrage pour cela
              ],
            ),*/
          ],
        ),
      ),
    );
  }
}
