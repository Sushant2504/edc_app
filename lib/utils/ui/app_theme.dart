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
        Color.fromARGB(255, 55, 16, 105),
        Color.fromARGB(255, 136, 90, 230)
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




}
