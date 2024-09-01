import 'package:flutter/material.dart';

class colors {
  static const appbar = Color.fromARGB(255, 245, 243, 243);
  static const songNameColor = TextStyle(color: Colors.black);
  static const artistNameColor =
      TextStyle(color: Color.fromARGB(255, 73, 66, 66));

  static const mainTitleColor = Colors.white;
}

bgTheme() {
  return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
        Color.fromARGB(255, 243, 235, 235),
        Color.fromARGB(255, 243, 240, 240),
      ]));
}

bgTheme1(Color color) {
  return BoxDecoration(
    gradient: RadialGradient(
      center: Alignment.center,
      radius: 7,
      colors: [
        color,
        Color.fromARGB(0, 245, 244, 244),
      ],
      stops: [0.0, 1.0],
    ),
    borderRadius: BorderRadius.circular(15),
  );
}
