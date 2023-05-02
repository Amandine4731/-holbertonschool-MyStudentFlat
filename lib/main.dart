import 'package:flutter/material.dart';
import 'login_page.dart';
/*import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';*/

/*import 'signup_page.dart';*/

const colorOrange = Color(0xFFFF5A47);
const colorBeige = Color(0xFFF7F3E8);
const colorDarkgrey = Color(0xFF878786);
const colorLightorange = Color(0xFFFFBBB3);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interface Application MyStudentFlat',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

 /* body: Row(
          children: [
            Container(
              color: colorOrange,
              child: Image.asset(
                'assets/images/illusBatîmentsTransparentsGauche.png',
              ),
            ),
            Container(
              color: Colors.orangeAccent,
              child: Image.asset(
                'logoMyStudentFlatBeige.png',
              ),
            ),
            Container(
              color: colorOrange,
              child: Image.asset(
                'assets/images/illusBatîmentsTransparentsDroite.png',
              ),
            ),
          ],*/

/*
child: Image.asset(
              'assets/images/logoMyStudentFlatBeige.png',
              width: 200,
),
*/