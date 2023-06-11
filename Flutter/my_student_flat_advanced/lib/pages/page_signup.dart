import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:my_student_flat_4/effects/effect_animation_delayed.dart';
import 'package:my_student_flat_4/main.dart';
import 'package:my_student_flat_4/pages/page_home.dart';
import 'package:my_student_flat_4/pages/page_login.dart';

class PageSignup extends StatefulWidget {
  const PageSignup({Key? key}) : super(key: key);

  @override
  _PageSignupState createState() => _PageSignupState();
}

class _PageSignupState extends State<PageSignup> {
  bool isTitleVisible = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String errorMessage = '';
  bool showError = false;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  Future<int> register() async {
    String email = emailController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;
    var url = 'http://152.228.216.105:5002/register';

    var response = await http.post(Uri.parse(url), body: {
      'mail': email,
      'password': password,
      'confirm_password': confirmPassword,
    });

    if (response.statusCode == 200) {
      print('Compte créé avec succès');
      return 200;
    } else if (response.statusCode == 406) {
      setState(() {
        showError = true;
        errorMessage = 'Ce compte utilisateur existe déjà.';
      });
      return response.statusCode;
    } else if (response.statusCode == 405) {
      setState(() {
        showError = true;
        errorMessage = 'Les mots de passe ne correspondent pas.';
      });
      return response.statusCode;
    } else {
      setState(() {
        showError = true;
        errorMessage = 'Erreur lors de la création du compte.';
      });
    }
    return response.statusCode;
  }

  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Compte créé'),
          content: Text('Votre compte a été créé avec succès.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageLogin(),
                  ),
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showErrorDialog() async {
    String errorText = "";
    final statusCode = await register();
    if (statusCode == 405) {
      errorText = "Les mots de passe ne correspondent pas.";
    } else if (statusCode == 406) {
      errorText = "Ce compte utilisateur existe déjà.";
    } else {
      errorText = "Erreur de création de compte, veuillez réessayer.";
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Erreur de création de compte'),
          content: Text(errorText),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorOrange,
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 250),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FractionallySizedBox(
                    widthFactor: 0.6,
                    child: Image.asset(
                      'assets/elements/logoMyStudentFlatBeige.png',
                    ),
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
            margin: EdgeInsets.only(bottom: 160),
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
            margin: EdgeInsets.only(bottom: 220),
            alignment: Alignment.bottomRight,
            child: EffectAnimationDelayed(
              delay: 10,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2.8,
                child: Image.asset(
                  'assets/elements/illusBatîmentsTransparentsDroite.png',
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 0,
              child: Image.asset('assets/elements/fondMaisonPageLogin.png'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 110, left: 40, right: 40),
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email...',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: colorDarkgrey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: colorOrange, width: 2.0),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: colorGrey),
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
                      borderSide: BorderSide(color: colorOrange, width: 2.0),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: colorGrey),
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
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelStyle: GoogleFonts.lato(
                      color: Colors.black.withOpacity(0.4),
                    ),
                    labelText: 'Confirmer le mot de passe...',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: colorDarkgrey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: colorOrange, width: 2.0),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: colorGrey),
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
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 55),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () async {
                  int statusCode = await register();
                  if (statusCode == 200) {
                    showSuccessDialog();
                  } else {
                    showErrorDialog();
                  }
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
                    'Créer un compte',
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
                    builder: (context) => PageLogin(),
                  ),
                );
              },
              child: Text(
                'Me connecter',
                style: GoogleFonts.roboto(
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
