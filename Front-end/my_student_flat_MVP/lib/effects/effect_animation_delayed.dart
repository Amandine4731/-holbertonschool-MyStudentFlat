/* Create a class to put an animation one pageSignup and PageLogin */
import 'package:flutter/material.dart';
import 'dart:async';

class EffectAnimationDelayed extends StatefulWidget {
  final Widget child;
  final int delay;
  const EffectAnimationDelayed({required this.delay, required this.child});

  @override
  State<EffectAnimationDelayed> createState() => _EffectAnimationDelayedState();
}

class _EffectAnimationDelayedState extends State<EffectAnimationDelayed>
    with SingleTickerProviderStateMixin {
  late AnimationController myController;
  late Animation<Offset> myAnimOffet;

  @override
  void initState() {
    super.initState();
    /* Initialize the animation controller */
    myController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );

    /* Create a curved animation using the controller */
    final curve =
        CurvedAnimation(parent: myController, curve: Curves.decelerate);

    /* Define the animation for the offset (slide) */
    myAnimOffet = Tween<Offset>(
      begin: Offset(0.0, 0.5),
      end: Offset.zero,
    ).animate(curve);

    /* Start the animation after the specified delay */
    Timer(Duration(milliseconds: widget.delay), () {
      myController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    /* Apply fade and slide transitions to the child widget */
    return FadeTransition(
      opacity: myController,
      /* Use the animation controller for opacity */
      child: SlideTransition(
        position: myAnimOffet,
        /* Use the animation for the slide position */
        child: widget.child, /* Render the provided child widget */
      ),
    );
  }
}
