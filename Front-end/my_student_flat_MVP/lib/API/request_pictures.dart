/* Create function to retrieve url pictures from API */
import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert';

import 'package:my_student_flat_MVP/API/dictionnary.dart';

import 'album.dart';

class RequestPictures extends StatefulWidget {
  final int id;
  const RequestPictures({Key? key, required this.id}) : super(key: key);

  @override
  _RequestPicturesState createState() => _RequestPicturesState();

  Future<List<String>> getImageUrls(int id) async {
    /* Method to fetch image URLs based on the provided ID */
    final data = await fetchData(id);

    if (data["informations"]["pictures"]["URL_picture"] !=
            "[\"\"]" && /* Check if the retrieved data contains image URLs */
        data["informations"]["pictures"] != "[\"\"]") {
      final results = data["informations"]["pictures"]["URL_picture"];
      if (results != "[\"\"]") {
        final myPictures = json.decode(results).cast<String>().toList();
        return myPictures;
      }
    }
    return [
      /* Return a default image URL if no URLs are found */
      "https://www.charlotteathleticclub.com/assets/camaleon_cms/image-not-found-4a963b95bf081c3ea02923dceaeb3f8085e1a654fc54840aac61a57a60903fef.png"
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

        return const Center();
      },
    );
  }
}
