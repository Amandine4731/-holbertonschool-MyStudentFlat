/* Create a component carousel with pictures of the flat */
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:my_student_flat_MVP/API/request_pictures.dart';

class ComponentPicturesCarousel extends StatefulWidget {
  final int cardId;

  const ComponentPicturesCarousel({Key? key, required this.cardId})
      : super(key: key);

  @override
  State<ComponentPicturesCarousel> createState() =>
      _ComponentPicturesCarouselState();
}

class _ComponentPicturesCarouselState extends State<ComponentPicturesCarousel> {
  final List imageList = [];

  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    final requestPictures = RequestPictures(
        id: 1); /* Retrieve image URLs using the RequestPictures class */
    requestPictures.getImageUrls(widget.cardId).then((imageUrls) {
      setState(() {
        imageList.addAll(imageUrls);
      });
    });
    print(requestPictures);
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
              /* Create the carousel */
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
                      fit: BoxFit.cover,
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
