import 'package:flutter/material.dart';
import 'dart:async';

class DelayedAnimation extends StatefulWidget {
  final Widget child;
  final int delay;
  const DelayedAnimation({required this.delay, required this.child});

  @override
  State<DelayedAnimation> createState() => _DelayedAnimationState();
}

class _DelayedAnimationState extends State<DelayedAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController myController;
  late Animation<Offset> myAnimOffet;
  @override
  void initState() {
    super.initState();
    myController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );

    final curve =
        CurvedAnimation(parent: myController, curve: Curves.decelerate);

    myAnimOffet = Tween<Offset>(
      begin: Offset(0.0, 0.5),
      end: Offset.zero,
    ).animate(curve);

    Timer(Duration(milliseconds: widget.delay), () {
      myController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: myController,
      child: SlideTransition(
        position: myAnimOffet,
        child: widget.child,
      ),
    );
  }
}
