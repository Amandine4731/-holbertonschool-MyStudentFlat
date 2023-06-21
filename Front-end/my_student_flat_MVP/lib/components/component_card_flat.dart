/* Create ccomponent to lay out a card of a flat */
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'package:my_student_flat_MVP/main.dart';

import 'package:my_student_flat_MVP/pages/page_description.dart';

import 'package:my_student_flat_MVP/components/component_pictures_carousel.dart';

class ComponentCardFlat extends StatefulWidget {
  final dynamic data;

  const ComponentCardFlat({required this.data, Key? key}) : super(key: key);

  @override
  _ComponentCardFlatState createState() => _ComponentCardFlatState();
}

class _ComponentCardFlatState extends State<ComponentCardFlat> {
  @override
  Widget build(BuildContext context) {
    final data = widget.data;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Card(
          /* Card widget to display the flat details */
          color: Colors.white,
          margin: EdgeInsets.only(top: 10, bottom: 15, left: 15, right: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 0, bottom: 12, left: 12, right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                if (data['apppartment']['agency'] !=
                    null) /* Display the agency name if exists */
                  Text(
                    data['apppartment']['agency'],
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w400,
                      color: colorDarkgrey,
                      fontSize: 16,
                    ),
                  ),
                SizedBox(width: 7),
                if (data['apppartment']['phonenumber'] !=
                    null) /* Display the phone number if exists */
                  Text(
                    data['apppartment']['phonenumber'],
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w800,
                      color: colorDarkgrey,
                      fontSize: 16,
                    ),
                  ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        duration: Duration(milliseconds: 400),
                        child: PageDescription(
                            data:
                                data), /* Display the description of the flat on tap */
                      ),
                    );
                  },
                  child: ComponentPicturesCarousel(
                      cardId: data['apppartment']['id']),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    data['apppartment']['name'],
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
                          if (data['apppartment']['postal_code'] !=
                              null) /* Display the postal code if exists */
                            Padding(
                              padding: EdgeInsets.only(
                                right: 7,
                              ),
                              child: Text(
                                data['apppartment']['postal_code'].toString(),
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w800,
                                  color: colorDarkgrey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          if (data['apppartment']['address'] != null &&
                              data['apppartment']['address']
                                  .isNotEmpty) /* Display the adress if exists */
                            Text(
                              data['apppartment']['address'],
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
                      child: data['apppartment']['square_meter'] !=
                              null /* Display the square meter if exists */
                          ? Text(
                              '${data['apppartment']['square_meter']} m²',
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.w800,
                                color: colorDarkgrey,
                                fontSize: 18,
                              ),
                            )
                          : SizedBox.shrink(),
                    ),
                    if (data['apppartment']['price'] !=
                        null) /* Display the price if exists */
                      Text(
                        '${data['apppartment']['price']} € / mois',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w800,
                          color: colorDarkgrey,
                          fontSize: 18,
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
}
