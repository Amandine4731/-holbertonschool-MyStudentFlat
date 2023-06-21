import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:my_student_flat_MVP/main.dart';
import 'package:my_student_flat_MVP/components/component_navigation_home_appbar.dart';
import 'package:my_student_flat_MVP/components/component_navigation_bottomappbar.dart';
import 'package:my_student_flat_MVP/components/component_card_flat.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  List<Map> AppartmentData = []; /* List to store the fetched apartment data */

  String? selectedValue; /* Selected value for the dropdown menu */
  bool showComponentCards =
      false; /* Flag to control the visibility of the component cards */
  bool showProgressIndicator =
      true; /* Flag to control the visibility of the progress indicator */

  @override
  void initState() {
    super.initState();
    fetchIds();
  }

  var urlStatusCode = 200;
  var id = 0;

  Future<void> fetchIds() async {
    AppartmentData = []; /* Clear the list before fetching new data */
    try {
      var url = "http://152.228.216.105:5000/appartments"; /* API URL */

      /* Set the URL based on the selected value in the dropdown menu */
      if (selectedValue == "Les plus récents") {
        url = "http://152.228.216.105:5000/appartments";
      } else if (selectedValue == 'Prix par ordre croissant') {
        url = "http://152.228.216.105:5000/appartments?sort=price_asc";
      } else if (selectedValue == 'Prix par ordre décroissant') {
        url = "http://152.228.216.105:5000/appartments?sort=price_desc";
      } else if (selectedValue == 'Surface par ordre croissant') {
        url = "http://152.228.216.105:5000/appartments?sort=surface_asc";
      } else if (selectedValue == 'Surface par ordre décroissant') {
        url = "http://152.228.216.105:5000/appartments?sort=surface_desc";
      }

      var api = Uri.parse(url);
      var response = await http.get(api);
      var urlStatusCode = response.statusCode;

      if (urlStatusCode != 200)
        return; /* Return if the response status code is not 200 */

      var jsonResponse = json.decode(response.body);

      for (int i = 0; i < jsonResponse.length; i++) {
        AppartmentData.add(
            jsonResponse[i]); /* Add each apartment data to the list */
      }

      setState(() {
        showComponentCards = true; /* Show the component cards */
        showProgressIndicator = false; /* Hide the progress indicator */
      });
    } catch (error) {
      print(
          'Erreur de requête HTTP : $error'); /* Print any error occurred during the request */
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBeige,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: ComponentNavigationHomeAppbar(),
      ),
      bottomNavigationBar: ComponentNavigationBottomappbar(),
      body: ListView(
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
                SizedBox(height: 15),
                DropdownButton<String>(
                  value: selectedValue,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: colorOrange,
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
                          fontSize: 16,
                        ),
                      ),
                    );
                  }).toList(),
                  underline: Container(
                    height: 0.5,
                    color: colorOrange,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue;
                      showComponentCards =
                          false; /* Hide the component cards during loading */
                      showProgressIndicator =
                          true; /* Show the progress indicator */
                    });
                    fetchIds(); /* Fetch new data based on the selected value */
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Visibility(
            visible: showProgressIndicator,
            child: Padding(
              padding: EdgeInsets.only(top: 250),
              child: CircularPercentIndicator(
                animation: true,
                animationDuration: 3000,
                radius: 50,
                lineWidth: 8,
                percent: 1,
                progressColor: colorOrange,
                backgroundColor: colorLightorange,
                circularStrokeCap: CircularStrokeCap.round,
                center: Icon(
                  Icons.business_rounded,
                  color: colorOrange,
                  size: 30,
                ),
                onAnimationEnd: () {
                  setState(() {
                    showComponentCards = true; /* Show the component cards */
                    showProgressIndicator =
                        false; /* Hide the progress indicator */
                  });
                },
              ),
            ),
          ),
          Opacity(
            opacity: showComponentCards ? 1.0 : 0.0,
            /* Set the opacity based on the visibility flag */
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: AppartmentData.length,
              itemBuilder: (context, index) {
                final data = AppartmentData[index];

                return ComponentCardFlat(
                    data: data); /* Create a card for each apartment data */
              },
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
