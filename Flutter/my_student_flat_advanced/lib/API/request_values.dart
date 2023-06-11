import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_student_flat_4/main.dart';

import 'album.dart';

class RequestValues extends StatefulWidget {
  const RequestValues({Key? key}) : super(key: key);

  @override
  _RequestValuesState createState() => _RequestValuesState();
}

Future<Album> fetchAlbum() async {
  final response =
      await http.get(Uri.parse('http://152.228.216.105/appartment/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Album');
  }
}

class _RequestValuesState extends State<RequestValues> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Album>(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final results = snapshot.data?.apppartment?.address;
          if (results != null) {
            return Text(
              results,
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w800,
                color: colorDarkgrey,
                fontSize: 17,
              ),
            );
          }
        }
        return Text('');
      },
    );
  }
}
