import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:my_student_flat_4/API/request_pictures.dart';

class ComponentPicturesCarousel extends StatefulWidget {
  @override
  _ComponentPicturesCarouselState createState() =>
      _ComponentPicturesCarouselState();
}

class _ComponentPicturesCarouselState extends State<ComponentPicturesCarousel> {
  final List imageList = [];

  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // Ajouter les images à la liste dans la méthode initState

    final requestPictures = RequestPictures();
    requestPictures.getImageUrls().then((imageUrls) {
      setState(() {
        imageList.addAll(imageUrls);
      });
    });
    /*final requestPicture0 = RequestPicture0();
    requestPicture0.getImageUrl().then((imageUrl) {
      setState(() {
        imageList.add(imageUrl);
      });
    });
    final requestPicture1 = RequestPicture1();

    requestPicture1.getImageUrl().then((imageUrl) {
      setState(() {
        imageList.add(imageUrl);
      });
    });
    final requestPicture2 = RequestPicture2();

    requestPicture2.getImageUrl().then((imageUrl) {
      setState(() {
        imageList.add(imageUrl);
      });
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemCount: imageList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill, // Remplit le conteneur avec l'image
                      image: NetworkImage(imageList[index]),
                    ),
                  ),
                );
              },
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: AnimatedSmoothIndicator(
                  activeIndex: _currentIndex,
                  count: imageList.length,
                  effect: WormEffect(
                    dotWidth: 10,
                    dotHeight: 10,
                    activeDotColor: Colors.white,
                    dotColor: Colors.grey.withOpacity(0.8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}