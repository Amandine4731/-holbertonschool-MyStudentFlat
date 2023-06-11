import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:my_student_flat_4/main.dart';

import 'package:my_student_flat_4/pages/page_home.dart';

import 'package:my_student_flat_4/components/component_navigation_home_appbar.dart';
import 'package:my_student_flat_4/components/component_navigation_bottomappbar.dart';
import 'package:my_student_flat_4/components/component_choices_number_of_pieces.dart';
import 'package:my_student_flat_4/components/component_slider_bar_area.dart';
import 'package:my_student_flat_4/components/component_slider_bar_price.dart';
import 'package:my_student_flat_4/components/component_choices_localization.dart';
import 'package:my_student_flat_4/components/component_choices_other_criteria.dart';

class PageFilters extends StatefulWidget {
  const PageFilters({Key? key}) : super(key: key);

  @override
  _PageFiltersState createState() => _PageFiltersState();
}

class _PageFiltersState extends State<PageFilters> {
  String? selectedValue;
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
      body: ListView(
        children: [
          ListTile(
            leading: Icon(
              Icons.arrow_back,
              color: colorOrange,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PageHome(),
                ),
              );
            },
            title: Text(
              'APPARTEMENT DE REVE',
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w900,
                color: colorOrange,
                fontSize: 14,
                decorationColor: colorOrange,
              ),
            ),
          ),
          const Divider(
            height: 10,
            thickness: 1,
            indent: 20,
            endIndent: 20,
            color: colorOrange,
          ),
          /* "Nombre de pièces" */
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
            padding: EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(5), // Ajouter des bords arrondis
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3), // Couleur de l'ombre
                  spreadRadius: 2, // Rayon d'expansion de l'ombre
                  blurRadius: 5, // Flou de l'ombre
                  offset: Offset(0, 3), // Décalage de l'ombre
                ),
              ],
            ),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.only(left: 15),
                  leading: Icon(
                    Icons.meeting_room_outlined,
                    color: colorDarkgrey,
                  ),
                  title: Text(
                    'Nombre de pièces :',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w600,
                      color: colorDarkgrey,
                      fontSize: 16,
                      decorationColor: colorOrange,
                    ),
                  ),
                ),
                SizedBox(height: 0), // Ajouter un espace entre les deux widgets
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 55, right: 15),
                          child: ComponentChoicesNumberOfPieces(),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          /* Surface habitable */
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
            padding: EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.only(left: 15),
                  leading: Icon(
                    Icons.view_in_ar,
                    color: colorDarkgrey,
                  ),
                  title: Text(
                    'Surface habitable :',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w600,
                      color: colorDarkgrey,
                      fontSize: 16,
                      decorationColor: colorOrange,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50, right: 15),
                  child: ComponentSliderBarArea(),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),

          /* "Budget" */
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
            padding: EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.only(left: 15),
                  leading: Icon(
                    Icons.savings_rounded,
                    color: colorDarkgrey,
                  ),
                  title: Text(
                    'Budget :',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w600,
                      color: colorDarkgrey,
                      fontSize: 16,
                      decorationColor: colorOrange,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50, right: 15),
                  child: ComponentSliderBarPrice(),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          /* "Localisation" */
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
            padding: EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                ListTile(
                  contentPadding:
                      EdgeInsets.only(left: 15), // Updated left padding value
                  leading: Icon(
                    Icons.travel_explore_rounded,
                    color: colorDarkgrey,
                  ),
                  title: Text(
                    'Localisation :',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w600,
                      color: colorDarkgrey,
                      fontSize: 16,
                      decorationColor: colorOrange,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 55, right: 15),
                  child: ComponentChoicesLocalization(),
                ),
                SizedBox(height: 10),
                Column(
                  children: [],
                ),
              ],
            ),
          ),
          /* Autres critères */
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
            padding: EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.only(left: 15),
                  leading: Icon(
                    Icons.emoji_transportation_rounded,
                    color: colorDarkgrey,
                  ),
                  title: Text(
                    'Autres critères :',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w600,
                      color: colorDarkgrey,
                      fontSize: 16,
                      decorationColor: colorOrange,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 55, right: 15),
                  child: ComponentChoicesOtherCriteria(),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
              bottom: 55,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(colorOrange),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    'Appliquer les filtres',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
