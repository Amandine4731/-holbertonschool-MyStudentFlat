import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mystudentflat2/delayed_animation.dart';
import 'package:mystudentflat2/main.dart';
import 'package:mystudentflat2/login_page.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorOrange,
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: 200,
            ),
            height: 140,
            alignment: Alignment.center,
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.6,
              child: Image.asset(
                'assets/images/logoMyStudentFlatBeige.png',
              ), // propriété fit définie sur BoxFit.cover
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              "Groups All Flats, In One App.",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic,
                color: colorBeige,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 30,
            ),
            alignment: Alignment.topLeft,
            child: DelayedAnimation(
              delay: 10,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.8,
                height: 580,
                child: Image.asset(
                  'assets/images/illusBatîmentsTransparentsGauche.png',
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: 230,
            ),
            alignment: Alignment.bottomRight,
            child: DelayedAnimation(
              delay: 10,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2.8,
                child: Image.asset(
                  'assets/images/illusBatîmentsTransparentsDroite.png',
                ), // propriété fit définie sur BoxFit.cover
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
                width: MediaQuery.of(context).size.width / 0,
                child: Image.asset('assets/images/fondMaisonPageLogin.png')),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 110, left: 40, right: 40),
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email...',
                    labelStyle: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 0,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                      ),
                      labelText: 'Mot de passe...'),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 0,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                      ),
                      labelText: 'Confirmer le mot de passe...'),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
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
                  // action à exécuter lors du clic sur le bouton
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
                    style: TextStyle(
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
                    builder: (context) => LoginPage(),
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
/*
class _LoginFormState extends State<LoginForm> {
  var obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: [
          DelayedAnimation(
            delay: 3500,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          DelayedAnimation(
            delay: 4500,
            child: TextField(
              obscureText: obscureText,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
                labelText: 'Mot de passe',
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

*/

/*
 border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 5.0),
                      )*/