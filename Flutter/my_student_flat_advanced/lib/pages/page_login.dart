import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:my_student_flat_4/main.dart';

import 'package:my_student_flat_4/pages/page_signup.dart';
import 'package:my_student_flat_4/pages/page_home.dart';

import 'package:my_student_flat_4/effects/effect_animation_delayed.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({Key? key}) : super(key: key);

  @override
  _PageLoginState createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  bool isTitleVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorOrange,
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 250), // Marge en bas de 300 pixels
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FractionallySizedBox(
                    widthFactor:
                        0.6, // Définit la largeur de l'image à 80% de la largeur de l'écran
                    child: Image.asset(
                        'assets/elements/logoMyStudentFlatBeige.png'),
                  ),
                  SizedBox(height: 30),
                  Visibility(
                    visible: isTitleVisible,
                    child: Text(
                      'Groups All Flats, In One App.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w800,
                        color: colorBeige,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: 160,
            ),
            alignment: Alignment.bottomLeft,
            child: EffectAnimationDelayed(
              delay: 10,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.8,
                height: 580,
                child: Image.asset(
                  'assets/elements/illusBatîmentsTransparentsGauche.png',
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: 220,
            ),
            alignment: Alignment.bottomRight,
            child: EffectAnimationDelayed(
              delay: 10,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2.8,
                child: Image.asset(
                  'assets/elements/illusBatîmentsTransparentsDroite.png',
                ), // propriété fit définie sur BoxFit.cover
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
                width: MediaQuery.of(context).size.width / 0,
                child: Image.asset('assets/elements/fondMaisonPageLogin.png')),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 150, left: 40, right: 40),
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email...',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: colorDarkgrey),
                      //  when the TextFormField in unfocused
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: colorOrange,
                        width: 2.0,
                      ),
                      //  when the TextFormField in focused
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: colorGrey),
                      // color for the border
                    ),
                    labelStyle: GoogleFonts.lato(
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  onTap: () {
                    setState(() {
                      isTitleVisible = false;
                    });
                  },
                  onSubmitted: (_) {
                    setState(() {
                      isTitleVisible = true;
                    });
                  },
                ),
                SizedBox(
                  height: 0,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelStyle: GoogleFonts.lato(
                      color: Colors.black.withOpacity(0.4),
                    ),
                    labelText: 'Mot de passe...',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: colorDarkgrey),
                      //  when the TextFormField in unfocused
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: colorOrange,
                        width: 2.0,
                      ),
                      //  when the TextFormField in focused
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: colorGrey),
                      // color for the border
                    ),
                  ),
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  onTap: () {
                    setState(() {
                      isTitleVisible = false;
                    });
                  },
                  onSubmitted: (_) {
                    setState(() {
                      isTitleVisible = true;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            margin: EdgeInsets.only(bottom: 90, right: 40),
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                // Ajouter l'action à exécuter lors du tap sur le bouton.
              },
              child: Text(
                'Mot de passe oublié ?',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                  decorationThickness: 1,
                  height: 1.5,
                ),
              ),
            ),
          ),
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
                      MaterialStateProperty.all<Color>(colorOrange),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: Text(
                    'Me connecter',
                    style: GoogleFonts.lato(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            margin: EdgeInsets.only(bottom: 5),
            alignment: Alignment.bottomCenter,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageSignup(),
                  ),
                );
              },
              child: Text(
                'Créer un compte',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w700,
                  color: colorOrange,
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                  decorationThickness: 1,
                  height: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}