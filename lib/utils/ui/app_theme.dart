import 'package:flutter/material.dart';

class Appthemes {
  //------------------------- theme for text background --------------------------//
  static final Decoration ktextBackground = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromARGB(255, 55, 16, 105),
        Color.fromARGB(255, 136, 90, 230)
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.3),
        spreadRadius: 2,
        offset: Offset(0, 2),
      )
    ],
  );

  //------------------------ eventcard theme -------------------------------//

  static final Decoration keventCard = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromARGB(255, 109, 49, 186),
        Color.fromARGB(255, 211, 197, 239),
      ],
    ),
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.3),
        spreadRadius: 2,
        offset: Offset(0, 2),
      )
    ],
  );

  //------------------------ year card theme -------------------------------//

  static final Decoration kyearCard = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromARGB(255, 109, 49, 186),
        Color.fromARGB(255, 211, 197, 239),
      ],
    ),
    borderRadius: BorderRadius.circular(20),
  );

  //------------------------ event theme -------------------------------//

  static final Decoration keventTheme = BoxDecoration(
    gradient: LinearGradient(colors: [
      Color.fromARGB(255, 55, 16, 105),
      Color.fromARGB(255, 136, 90, 230)
    ]),
    borderRadius: BorderRadius.circular(10.0),
  );


  //------------------------ newsletter theme -------------------------------//
  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      primary: Colors.deepPurple,
      secondary: Colors.deepPurple[300]!,
      background: Colors.deepPurple[50]!,
    ),
    scaffoldBackgroundColor: Colors.deepPurple[50]!,
  );

    
}
