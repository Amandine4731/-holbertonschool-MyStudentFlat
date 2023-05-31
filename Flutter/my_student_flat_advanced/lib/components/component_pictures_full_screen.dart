import 'package:flutter/material.dart';

import 'package:my_student_flat_4/main.dart';

import 'package:my_student_flat_4/components/component_pictures_carousel.dart';

class ComponentPicturesFullScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: ComponentPicturesCarousel(),
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
