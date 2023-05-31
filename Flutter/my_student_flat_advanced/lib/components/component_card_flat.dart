import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_student_flat_4/components/component_pictures_carousel.dart';
import 'package:my_student_flat_4/main.dart';
import 'package:my_student_flat_4/pages/page_description.dart';

class ComponentCardFlat extends StatefulWidget {
  const ComponentCardFlat({Key? key}) : super(key: key);

  @override
  _ComponentCardFlatState createState() => _ComponentCardFlatState();
}

class _ComponentCardFlatState extends State<ComponentCardFlat> {
  bool isFavoriteOn = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 15,
            right: 22,
          ),
          child: Text(
            'aujourd\'hui 17h07',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w400,
              color: colorGrey,
              fontSize: 14,
            ),
          ),
        ),
        Card(
          color: Colors.white,
          margin: EdgeInsets.only(top: 10, bottom: 15, left: 10, right: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 0, bottom: 12, left: 12, right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Foncia',
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w400,
                        color: colorDarkgrey,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        '05 62 94 60 60',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w800,
                          color: colorDarkgrey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    IconButton(
                      iconSize: 25.0,
                      icon: Icon(
                        color: colorOrange,
                        isFavoriteOn
                            ? Icons.favorite
                            : Icons
                                .favorite_outline, // Changer l'icône de notification en fonction de l'état actuel de isFavoriteOn
                      ),
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          // Mettre à jour l'état de isFavoriteOn lorsque l'utilisateur clique sur l'icône de notification
                          isFavoriteOn = !isFavoriteOn;
                        });
                      },
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageDescription(),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: double.infinity,
                    height: 210,
                    child: ComponentPicturesCarousel(),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Roseraie (31500)',
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w800,
                        color: colorDarkgrey,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '-',
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w800,
                        color: colorDarkgrey,
                        fontSize: 18,
                      ),
                    ), // Ajouter un espace entre les deux textes
                    SizedBox(width: 8),
                    Text(
                      'Roseraie, Jolimont',
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w400,
                        color: colorDarkgrey,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      'Non meublé - 2 pièces - 1 chambre - Terrasse',
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w400,
                        color: colorDarkgrey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '43 m²',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w900,
                          color: colorDarkgrey,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Text(
                      '590 € cc',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w900,
                        color: colorDarkgrey,
                        fontSize: 20,
                      ),
                    ), // Ajouter un espace entre les deux textes
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
