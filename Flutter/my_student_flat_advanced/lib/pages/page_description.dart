import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:my_student_flat_4/main.dart';

import 'package:my_student_flat_4/pages/page_home.dart';

import 'package:my_student_flat_4/components/component_navigation_appbar.dart';
import 'package:my_student_flat_4/components/component_navigation_bottomappbar.dart';
import 'package:my_student_flat_4/components/component_pictures_carousel.dart';
import 'package:my_student_flat_4/components/component_pictures_full_screen.dart';

class PageDescription extends StatelessWidget {
  const PageDescription({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBeige,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(90), // Define the height of the custom app bar
        child: ComponentNavigationAppbar(),
      ),
      bottomNavigationBar: ComponentNavigationBottomappbar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 5),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              color: colorDarkgrey,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageHome(),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                  left: 25,
                  right: 25,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.all(0),
                      padding: EdgeInsets.only(top: 0, bottom: 10),
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
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
                              SizedBox(
                                  width:
                                      10), // Add spacing between the two texts
                              Text(
                                '05 62 94 60 60',
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w800,
                                  color: colorDarkgrey,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ComponentPicturesFullScreen(),
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
                              ), // Add spacing between the two texts
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
                              Text(
                                '43 m²',
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w900,
                                  color: colorDarkgrey,
                                  fontSize: 22,
                                ),
                              ),
                              SizedBox(width: 200),
                              Text(
                                '590 € cc',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w900,
                                  color: colorDarkgrey,
                                  fontSize: 22,
                                ),
                              ), // Add spacing between the two texts
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(
                        top: 15,
                      ),
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Référence de l\'annonce :',
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w400,
                                  color: colorDarkgrey,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                  width:
                                      5), // Add spacing between the two texts
                              Text(
                                'XXXXXX',
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w900,
                                  color: colorDarkgrey,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(
                        top: 30,
                      ),
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Description :',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w600,
                                  color: colorOrange,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                  height:
                                      8), // Add spacing between the two texts
                              Text(
                                'argoulet, dans une résidence récente sécurisée, proche commerces et transport appartement de type 2 avec balcon, un séjour, une cuisine équipée, une chambre avec placard, salle de bains, wc. un balcon et un parking',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w400,
                                  color: colorDarkgrey,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 15),
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(
                                  bottom: 55,
                                ),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PageHome(),
                                        ),
                                      );
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              colorGrey),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 60),
                                      child: Text(
                                        'Plus d\'informations',
                                        style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
