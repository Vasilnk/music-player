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
