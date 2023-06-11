import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:my_student_flat_4/main.dart';

import 'package:my_student_flat_4/pages/page_home.dart';

import 'package:my_student_flat_4/components/component_navigation_appbar.dart';
import 'package:my_student_flat_4/components/component_navigation_bottomappbar.dart';

class PageAccountChanging extends StatefulWidget {
  const PageAccountChanging({Key? key}) : super(key: key);

  @override
  _PageAccountChangingState createState() => _PageAccountChangingState();
}

class _PageAccountChangingState extends State<PageAccountChanging> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBeige,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            70), // Définir la hauteur de la barre d'app personnalisée
        child: ComponentNavigationAppbar(),
      ),
      bottomNavigationBar: ComponentNavigationBottomappbar(),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(
              Icons.arrow_back,
              color: colorOrange,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PageHome(),
                ),
              );
            },
            title: Text(
              'Mon Compte',
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w900,
                color: colorOrange,
                fontSize: 14,
                decorationColor: colorOrange,
              ),
            ),
          ),
          const Divider(
            height: 10,
            thickness: 1,
            indent: 20,
            endIndent: 20,
            color: colorOrange,
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(left: 40, right: 40),
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
                        color: colorLightgrey,
                        width: 2.0,
                      ),
                      //  when the TextFormField in focused
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: colorGrey),
                      // color for the border
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
                SizedBox(
                  height: 15,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelStyle: GoogleFonts.lato(
                      color: colorLightgrey,
                    ),
                    labelText: 'Mot de passe...',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: colorDarkgrey),
                      //  when the TextFormField in unfocused
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: colorLightgrey,
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
                    color: colorGrey,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5, bottom: 15, right: 40),
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {
                // Ajouter l'action à exécuter lors du tap sur le bouton.
              },
              child: Text(
                'Modifier le mot de passe',
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
                      //  when the TextFormField in unfocused
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: colorLightgrey,
                        width: 2.0,
                      ),
                      //  when the TextFormField in focused
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: colorGrey),
                      // color for the border
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
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Nom...',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: colorDarkgrey),
                      //  when the TextFormField in unfocused
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: colorLightgrey,
                        width: 2.0,
                      ),
                      //  when the TextFormField in focused
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: colorGrey),
                      // color for the border
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
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Date de naissance (XX/XX/XXXX)...',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: colorDarkgrey),
                      //  when the TextFormField in unfocused
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: colorLightgrey,
                        width: 2.0,
                      ),
                      //  when the TextFormField in focused
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: colorGrey),
                      // color for the border
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
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Numéro de téléphone...',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: colorDarkgrey),
                      //  when the TextFormField in unfocused
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: colorLightgrey,
                        width: 2.0,
                      ),
                      //  when the TextFormField in focused
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: colorGrey),
                      // color for the border
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
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Code postal...',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: colorDarkgrey),
                      //  when the TextFormField in unfocused
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: colorLightgrey,
                        width: 2.0,
                      ),
                      //  when the TextFormField in focused
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: colorGrey),
                      // color for the border
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
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    bottom: 55,
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () {},
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
                          'Enregistrer les modifications',
                          style: GoogleFonts.lato(
                            fontSize: 18,
                          ),
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
    );
  }
}
