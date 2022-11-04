
import 'package:flutter/material.dart';

ThemeData englishTheme=ThemeData(
  fontFamily: 'PlayfairDisplay',
    textTheme: TextTheme(
      headline1:const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold, fontSize: 20) ,
      headline2:const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold, fontSize: 26) ,
      bodyText1: TextStyle(
          height: 2, fontSize: 17, color: Colors.grey[620]),
    )
);
ThemeData arabicTheme=ThemeData(
  fontFamily: 'Cairo',
    textTheme: TextTheme(
      headline1: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold, fontSize: 20) ,
      headline2: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold, fontSize: 26) ,
      bodyText1: TextStyle(
          height: 2, fontSize: 17, color: Colors.grey[620]),
    )
);