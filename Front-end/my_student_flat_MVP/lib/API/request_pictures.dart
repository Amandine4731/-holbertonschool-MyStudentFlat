import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:my_student_flat_MVP/API/dictionnary.dart';

import 'album.dart';

class RequestPictures extends StatefulWidget {
  final int id;
  const RequestPictures({Key? key, required this.id}) : super(key: key);
  void main() async {
    var urlStatusCode = 200;
    var id = 0;

    for (id = 1; urlStatusCode == 200; id++) {
      var url = Uri.parse("http://152.228.216.105/appartment/$id");
      var response = await http.get(url);
      urlStatusCode = response.statusCode;

      if (urlStatusCode != 200) {
        continue;
      }
      fetchData(id);
    }
  }

  @override
  _RequestPicturesState createState() => _RequestPicturesState();

  Future<List<String>> getImageUrls(int id) async {
    final album = await fetchData(id);

    if (album["informations"]["pictures"]["URL_picture"] != "" &&
        album["informations"]["pictures"] != "") {
      final results = album["informations"]["pictures"]["URL_picture"];
      if (results != "null") {
        final myPictures = json.decode(results).cast<String>().toList();
        return myPictures;
      }
    }
    return [
      'https://i.pinimg.com/564x/fb/e6/58/fbe658950ed0c902ef23e24b7c1cd8c4.jpg'
    ];
  }
}

class _RequestPicturesState extends State<RequestPictures> {
  late Future<Album> futureAlbum;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: widget.getImageUrls(widget.id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final imageUrls = snapshot.data!;
          return ListView.builder(
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              final imageUrl = imageUrls[index];
              return Text(imageUrl);
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
