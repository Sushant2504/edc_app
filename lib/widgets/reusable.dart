import 'package:flutter/material.dart';

buildHeader(String title, {Color? color}) {
  return Center(
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        // fontFamily: 'BatmanForever',
        color: color ?? Colors.white,
      ),
    ),
  );
}

