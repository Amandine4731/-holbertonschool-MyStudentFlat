/* Create page to display more informations about the flat */
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:my_student_flat_MVP/main.dart';

import 'package:my_student_flat_MVP/components/component_pictures_carousel.dart';
import 'package:my_student_flat_MVP/components/component_pictures_full_screen.dart';

class PageDescription extends StatelessWidget {
  final dynamic data;

  const PageDescription({Key? key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBeige,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 65),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              color: colorDarkgrey,
              onPressed: () {
                Navigator.pop(context);
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
                          SizedBox(
                            width: double.infinity,
                            child: data['apppartment']["agency"] == true
                                ? Text(
                                    data['apppartment']["agency"],
                                    style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w400,
                                      color: colorDarkgrey,
                                      fontSize: 16,
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: data['apppartment']["phonenumber"] == true
                                ? Text(
                                    data['apppartment']["phonenumber"],
                                    style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w800,
                                      color: colorDarkgrey,
                                      fontSize: 16,
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ComponentPicturesFullScreen(
                                    /* Allows you to enlarge the image on tap */
                                    cardId: data['apppartment']["id"],
                                  ),
                                ),
                              );
                            },
                            child: SizedBox(
                              width: double.infinity,
                              height: 250,
                              child: ComponentPicturesCarousel(
                                cardId: data['apppartment']["id"],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              data['apppartment']["name"],
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.w800,
                                color: colorDarkgrey,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          SizedBox(height: 7),
                          Row(
                            children: [
                              Flexible(
                                child: Wrap(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        right: 7,
                                      ),
                                      child: Text(
                                        data['apppartment']["postal_code"]
                                            .toString(),
                                        style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w800,
                                          color: colorDarkgrey,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    if (data['apppartment']["address"]
                                        .isNotEmpty)
                                      Text(
                                        data['apppartment']["address"],
                                        style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w400,
                                          color: colorGrey,
                                          fontSize: 16,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                  child: Text(
                                data['apppartment']["square_meter"].toString() +
                                    ' m²',
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w800,
                                  color: colorDarkgrey,
                                  fontSize: 18,
                                ),
                              )),
                              Text(
                                data['apppartment']["price"].toString() +
                                    ' € / mois',
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w800,
                                  color: colorDarkgrey,
                                  fontSize: 18,
                                ),
                              )
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
                              SizedBox(width: 5),
                              Text(
                                data['apppartment']["ref"],
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
                                  fontWeight: FontWeight.w800,
                                  color: colorDarkgrey,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                data['apppartment']["description"],
                                textAlign: TextAlign.left,
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w400,
                                  color: colorGrey,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 25),
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(
                                  bottom: 55,
                                ),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      final String url = data['apppartment'][
                                          "url"]; /* Get the URL from the data */
                                      Uri uri = Uri.parse(
                                          url); /* Parse the URL into a Uri object */

                                      if (await launchUrl(uri)) {
                                        /* Check if the URL can be launched */
                                        await launchUrl(
                                            uri); /* Launch the URL */
                                      } else {
                                        throw 'Impossible d\'ouvrir l\'URL : $url'; /* Throw an error if the URL cannot be opened */
                                      }
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              colorOrange),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      child: Text(
                                        'Plus d\'informations',
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
