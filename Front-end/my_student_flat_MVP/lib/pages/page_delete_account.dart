/* Create a page to delete your account */
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

import 'package:my_student_flat_MVP/main.dart';

import 'package:my_student_flat_MVP/pages/page_login.dart';

import 'package:my_student_flat_MVP/components/component_navigation_bottomappbar.dart';
import 'package:my_student_flat_MVP/components/component_navigation_home_appbar.dart';

class PageAccountChanging extends StatefulWidget {
  const PageAccountChanging({Key? key}) : super(key: key);

  @override
  _PageAccountChangingState createState() => _PageAccountChangingState();
}

class _PageAccountChangingState extends State<PageAccountChanging> {
  String? selectedValue;
  bool isDeleteAccountClicked = false;
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _onDeleteAccountClicked() {
    /* Function called when delete account button is clicked */
    setState(() {
      isDeleteAccountClicked = true;
    });
  }

  void _onCancelClicked() {
    /*  Function called when cancel button is clicked */
    setState(() {
      isDeleteAccountClicked = false;
      mailController.clear();
      passwordController.clear();
    });
  }

  Future<void> _onDeleteConfirmClicked() async {
    /* Function called when delete confirmation button is clicked */
    String mail = mailController.text;
    String password = passwordController.text;

    if (mail.isNotEmpty && password.isNotEmpty) {
      var response = await http.post(
        Uri.parse('http://152.228.216.105:5002/delete_account'),
        body: {
          'mail': mail,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        /* check if Account deleted successfully */
        print('Compte supprimé avec succès : $mail');
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => PageLogin()),
          (route) => false,
        );
      } else if (response.statusCode == 411) {
        /* check if email or password are incorrect */
        print("Nom d'utilisateur ou mot de passe incorrect.");
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Erreur'),
              content: Text("Nom d'utilisateur ou mot de passe incorrect."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
      _onCancelClicked();
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erreur'),
            content: Text("Veuillez remplir tous les champs"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      print('Veuillez remplir tous les champs');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isDeleteAccountClicked) {
          setState(() {
            isDeleteAccountClicked = false;
            mailController.clear();
            passwordController.clear();
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: colorBeige,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: ComponentNavigationHomeAppbar(),
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
                Navigator.pop(context);
              },
              title: Text(
                'Mon Compte',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w900,
                  color: colorOrange,
                  fontSize: 16,
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
              height: 70,
            ),
            Container(
              margin: EdgeInsets.only(left: 40, right: 40),
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(
                      bottom: 55,
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        onPressed: _onDeleteAccountClicked,
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed) ||
                                states.contains(MaterialState.disabled)) {
                              return colorGrey;
                            }

                            return colorOrange;
                          }),
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
                            'Supprimer mon compte',
                            style: GoogleFonts.lato(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (isDeleteAccountClicked)
                    Column(
                      children: [
                        TextField(
                          controller: mailController,
                          decoration: InputDecoration(
                            labelStyle: GoogleFonts.lato(
                              color: Colors.black.withOpacity(0.4),
                            ),
                            labelText: 'Email...',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: colorDarkgrey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: colorOrange, width: 2.0),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: colorGrey),
                            ),
                          ),
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelStyle: GoogleFonts.lato(
                              color: Colors.black.withOpacity(0.4),
                            ),
                            labelText: 'Mot de passe...',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: colorDarkgrey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: colorOrange, width: 2.0),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: colorGrey),
                            ),
                          ),
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: _onCancelClicked,
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        colorOrange),
                              ),
                              child: Text('Annuler'),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: _onDeleteConfirmClicked,
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        colorOrange),
                              ),
                              child: Text('Confirmer'),
                            ),
                          ],
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
