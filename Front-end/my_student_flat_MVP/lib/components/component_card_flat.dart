import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

import 'package:my_student_flat_MVP/main.dart';

import 'package:my_student_flat_MVP/pages/page_description.dart';

import 'package:my_student_flat_MVP/components/component_pictures_carousel.dart';

import 'package:my_student_flat_MVP/API/dictionnary.dart';

class ComponentCardFlat extends StatefulWidget {
  final int id;

  const ComponentCardFlat({required this.id, Key? key}) : super(key: key);

  @override
  _ComponentCardFlatState createState() => _ComponentCardFlatState();
}

class _ComponentCardFlatState extends State<ComponentCardFlat> {
  bool isFavoriteOn = false;

  @override
  void initState() {
    super.initState();
    fetchIds();
  }

  var urlStatusCode = 200;
  List<int> ids = [];

  Future<void> fetchIds() async {
    try {
      for (int id = 1; urlStatusCode == 200; id++) {
        var url = Uri.parse("http://152.228.216.105/appartment/$id");
        var response = await http.get(url);
        urlStatusCode = response.statusCode;

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
    return FutureBuilder<Map<String, dynamic>>(
      future: fetchData(widget.id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final agency = snapshot.data?['appartment']['agency'];
          final agencyText = agency ?? '';
          final phoneNumber = snapshot.data?['appartment']['phonenumber'];
          final phoneNumberText = phoneNumber ?? '';
          final name = snapshot.data?['appartment']['name'];
          final nameText = name ?? '';
          final address = snapshot.data?['appartment']['address'];
          final addressText = address ?? '';
          final squareMeter =
              snapshot.data?['appartment']['squareMeter'].toString();
          final squareMeterText = squareMeter ?? '';
          final price = snapshot.data?['appartment']['price'].toString();
          final priceText = price ?? '';
          final postalCode =
              snapshot.data?['appartment']['postalCode'].toString();
          final postalCodeText = postalCode ?? '';
          final reference = snapshot.data?['appartment']['ref'];

          final description = snapshot.data?['appartment']['description'];

          final urlAgency = snapshot.data?['appartment']['url'];

          final data = {
            "id": widget.id,
            "agency": agency,
            "phoneNumber": phoneNumber,
            "name": name,
            "address": address,
            "squareMeter": squareMeter,
            "price": price,
            "postalCode": postalCode,
            "reference": reference,
            "description": description,
            "urlAgency": urlAgency,
          };

          final picturesText = ComponentPicturesCarousel(cardId: widget.id);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Card(
                color: Colors.white,
                margin:
                    EdgeInsets.only(top: 10, bottom: 15, left: 15, right: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 0, bottom: 12, left: 12, right: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      agencyText.isNotEmpty
                          ? Text(
                              agencyText,
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.w400,
                                color: colorDarkgrey,
                                fontSize: 16,
                              ),
                            )
                          : SizedBox.shrink(),
                      SizedBox(width: 7),
                      phoneNumberText.isNotEmpty
                          ? Text(
                              phoneNumberText,
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.w800,
                                color: colorDarkgrey,
                                fontSize: 16,
                              ),
                            )
                          : SizedBox.shrink(),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PageDescription(data: data),
                            ),
                          );
                        },
                        child: picturesText,
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          nameText,
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
                                if (postalCodeText.isNotEmpty)
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: 7,
                                    ),
                                    child: Text(
                                      postalCodeText,
                                      style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w800,
                                        color: colorDarkgrey,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                if (addressText.isNotEmpty)
                                  Text(
                                    addressText,
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
                            child: squareMeterText.isNotEmpty
                                ? Text(
                                    '$squareMeterText m²',
                                    style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w800,
                                      color: colorDarkgrey,
                                      fontSize: 18,
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ),
                          priceText.isNotEmpty
                              ? Text(
                                  '$priceText € / mois',
                                  style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w800,
                                    color: colorDarkgrey,
                                    fontSize: 18,
                                  ),
                                )
                              : SizedBox.shrink(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text("Erreur : ${snapshot.error}");
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
