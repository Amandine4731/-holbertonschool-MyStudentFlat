import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_student_flat_4/components/component_pictures_carousel.dart';
import 'package:my_student_flat_4/main.dart';
import 'package:my_student_flat_4/pages/page_description.dart';
import 'package:my_student_flat_4/API/request_values.dart';

class ComponentCardFlat extends StatefulWidget {
  const ComponentCardFlat({Key? key}) : super(key: key);

  @override
  _ComponentCardFlatState createState() => _ComponentCardFlatState();
}

class _ComponentCardFlatState extends State<ComponentCardFlat> {
  bool isFavoriteOn = false;

  Widget componentFavoriteCardFlat() {
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
                        isFavoriteOn ? Icons.favorite : Icons.favorite_border,
                        color: colorOrange,
                      ),
                      onPressed: () {
                        setState(() {
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
                    height: 250,
                    child: ComponentPicturesCarousel(),
                  ),
                ),
                SizedBox(height: 10),
                RequestValues(),
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
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return componentFavoriteCardFlat();
  }
}
