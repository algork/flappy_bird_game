import 'dart:async';
import 'package:flutter/material.dart';

import '../game/assets.dart';

class TapSignBlink extends StatefulWidget {
  const TapSignBlink({
    super.key,
  });

  @override
  TapSignBlinkState createState() => TapSignBlinkState();
}

class TapSignBlinkState extends State<TapSignBlink> {
  final int interval = 600;
  late bool showFirstImage;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    showFirstImage = true;

    timer = Timer.periodic(Duration(milliseconds: interval), (timer) {
      setState(() {
        showFirstImage = !showFirstImage;
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.scale(
          scale: 2,
          child: Image.asset(
            showFirstImage ? Assets.tapSignRed : Assets.tapSignGrey,
            fit: BoxFit.contain, // Adjust this as needed
          ),
        ),
      ],
    );
  }
}
