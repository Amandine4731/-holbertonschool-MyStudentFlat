/* main page to run the app */
import 'package:flutter/material.dart';
import 'package:my_student_flat_MVP/pages/page_login.dart';

const colorOrange = Color(0xFFFF5A47);
const colorBeige = Color.fromARGB(255, 248, 244, 233);
const colorCardBeige = Color.fromARGB(255, 229, 229, 229);
const colorDarkgrey = Color.fromARGB(255, 94, 94, 94);
const colorGrey = Color.fromARGB(255, 145, 145, 145);
const colorLightgrey = Color.fromARGB(255, 210, 210, 210);
const colorLightorange = Color.fromARGB(255, 255, 209, 204);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyStudentFlat',
      debugShowCheckedModeBanner: false,
      home: PageLogin(),
    );
  }
}
