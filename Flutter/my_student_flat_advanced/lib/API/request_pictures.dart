import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:my_student_flat_4/API/request_values.dart';
import 'package:my_student_flat_4/API/request_values.dart';
import 'dart:convert';

import 'album.dart';

class RequestPictures extends StatefulWidget {
  const RequestPictures({Key? key}) : super(key: key);

  @override
  _RequestPicturesState createState() => _RequestPicturesState();

  Future<List<String>> getImageUrls() async {
    final album = await fetchAlbum();
    if (album.information != null && album.information!.pictures != null) {
      final results = album.information!.pictures!.uRLPicture;
      if (results != null) {
        final myPictures = json.decode(results).cast<String>().toList();
        return myPictures;
      }
    }
    throw Exception('Image not found');
  }
}

class _RequestPicturesState extends State<RequestPictures> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: widget.getImageUrls(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final imageUrls = snapshot.data!;
          return ListView.builder(
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              final imageUrl = imageUrls[index];
              return Text(imageUrl); // Return the URL as a text widget
            },
          );
        } else if (snapshot.hasError) {
          print('${snapshot.error}');
          return Text('Error: ${snapshot.error}');
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
