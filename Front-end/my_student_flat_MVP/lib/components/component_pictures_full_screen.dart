/* Create a component to display pictures bigger */
import 'package:flutter/material.dart';

import 'package:my_student_flat_MVP/main.dart';

import 'package:my_student_flat_MVP/components/component_pictures_carousel.dart';

class ComponentPicturesFullScreen extends StatelessWidget {
  final int cardId;

  const ComponentPicturesFullScreen({super.key, required this.cardId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              height: 290,
              child: ComponentPicturesCarousel(
                cardId: cardId,
              ),
            ),
          ),
          Positioned(
            top: 125,
            right: 20,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(
                Icons.close,
                color: colorDarkgrey,
                size: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
