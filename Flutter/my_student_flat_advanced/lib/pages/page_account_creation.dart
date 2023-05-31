import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:my_student_flat_4/main.dart';

import 'package:my_student_flat_4/pages/page_signup.dart';
import 'package:my_student_flat_4/pages/page_home.dart';

class PageAccountCreation extends StatefulWidget {
  const PageAccountCreation({Key? key}) : super(key: key);

  @override
  _PageAccountCreationState createState() => _PageAccountCreationState();
}

class _PageAccountCreationState extends State<PageAccountCreation> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBeige,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: colorDarkgrey,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PageSignup(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10), // Marge en bas de 300 pixels
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FractionallySizedBox(
                        widthFactor:
                            0.4, // Définit la largeur de l'image à 80% de la largeur de l'écran
                        child: Image.asset(
                            'assets/elements/logoMyStudentFlatOrange.png'),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Groups All Flats, In One App.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w400,
                          color: colorOrange,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.only(left: 40, right: 40),
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Prénom',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: colorDarkgrey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: colorLightgrey,
                            width: 2.0,
                          ),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: colorGrey),
                        ),
                        labelStyle: GoogleFonts.lato(
                          color: colorLightgrey,
                        ),
                      ),
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Nom...',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: colorDarkgrey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: colorLightgrey,
                            width: 2.0,
                          ),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: colorGrey),
                        ),
                        labelStyle: GoogleFonts.lato(
                          color: colorLightgrey,
                        ),
                      ),
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Date de naissance (XX/XX/XXXX)...',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: colorDarkgrey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: colorLightgrey,
                            width: 2.0,
                          ),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: colorGrey),
                        ),
                        labelStyle: GoogleFonts.lato(
                          color: colorLightgrey,
                        ),
                      ),
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Numéro de téléphone...',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: colorDarkgrey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: colorLightgrey,
                            width: 2.0,
                          ),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: colorGrey),
                        ),
                        labelStyle: GoogleFonts.lato(
                          color: colorLightgrey,
                        ),
                      ),
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Code postal...',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: colorDarkgrey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: colorLightgrey,
                            width: 2.0,
                          ),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: colorGrey),
                        ),
                        labelStyle: GoogleFonts.lato(
                          color: colorLightgrey,
                        ),
                      ),
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 55),
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
                              MaterialStateProperty.all<Color>(colorOrange),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Text(
                            'Créer mon compte',
                            style: GoogleFonts.lato(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
