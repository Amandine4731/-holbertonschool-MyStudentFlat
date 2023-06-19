import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:my_student_flat_MVP/main.dart';

import 'package:my_student_flat_MVP/pages/page_home4.dart';
import 'package:my_student_flat_MVP/pages/page_home6.dart';

import 'package:my_student_flat_MVP/components/component_navigation_home_appbar.dart';
import 'package:my_student_flat_MVP/components/component_navigation_bottomappbar.dart';
import 'package:my_student_flat_MVP/components/component_card_flat.dart';

import 'package:my_student_flat_MVP/API/dictionnary.dart';

class PageHome5 extends StatefulWidget {
  const PageHome5({Key? key}) : super(key: key);

  @override
  _PageHome5State createState() => _PageHome5State();
}

class _PageHome5State extends State<PageHome5> {
  List<int> ids = [];

  int selectedContainerIndex = -1;
  String? selectedValue;
  bool showFavorites = false;
  bool showComponentCards = false;
  bool showProgressIndicator = true;

  List<ComponentCardFlat> myFavorites = [];

  @override
  void initState() {
    super.initState();
    selectedContainerIndex = 0;
    fetchIds();
  }

  var urlStatusCode = 200;
  var id = 0;
  Future<void> fetchIds() async {
    try {
      for (int id = 61; id <= 80; id++) {
        var url = Uri.parse("http://152.228.216.105/appartment/$id");
        var response = await http.get(url);
        var urlStatusCode = response.statusCode;

        if (urlStatusCode != 200) {
          continue;
        }

        setState(() {
          ids.add(id);
        });

        fetchData(id);
      }
    } catch (error) {
      print('Erreur de requête HTTP : $error');
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
                    showComponentCards = true;
                    showProgressIndicator = false;
                  });
                },
              ),
            ),
          ),
          Opacity(
            opacity: showComponentCards ? 1.0 : 0.0,
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: ids.length,
              itemBuilder: (context, index) {
                final id = ids[index];
                return ComponentCardFlat(id: id);
              },
            ),
          ),
          SizedBox(height: 30),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageHome4(),
                      ),
                    );
                  },
                  child: Opacity(
                    opacity: showComponentCards ? 1.0 : 0.0,
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: colorOrange,
                      size: 22,
                    ),
                  ),
                ),
                SizedBox(width: 45),
                Opacity(
                  opacity: showComponentCards ? 1.0 : 0.0,
                  child: Text(
                    '5',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w800,
                      color: colorOrange,
                      fontSize: 15,
                    ),
                  ),
                ),
                Opacity(
                  opacity: showComponentCards ? 1.0 : 0.0,
                  child: Text(
                    ' / 15',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w800,
                      color: colorLightorange,
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(width: 45),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageHome6(),
                      ),
                    );
                  },
                  child: Opacity(
                    opacity: showComponentCards ? 1.0 : 0.0,
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: colorOrange,
                      size: 22,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
