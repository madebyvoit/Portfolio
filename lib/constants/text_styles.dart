import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/fonts.dart';

class CustomStyle {
  CustomStyle._();

  static const TextStyle navbar = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.0,
    fontFamily: Fonts.navbar,
    color: Pallete.aliceblue,
  );

  static const TextStyle navbarhover = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.0,
    fontFamily: Fonts.navbar,
    color: Pallete.darkgrey,
  );

  static const TextStyle bignavbar = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.0,
    fontFamily: Fonts.navbar,
    color: Pallete.aliceblue,
  );

  static const TextStyle sozialmenu = TextStyle(
    fontFamily: Fonts.navbar,
    fontSize: 16.0,
    color: Pallete.aliceblue,
    letterSpacing: 1.0,
  );

  static const TextStyle heroHeading = TextStyle(
    fontSize: 50.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.0,
    fontFamily: Fonts.navbar,
    color: Pallete.aliceblue,
  );

  static const TextStyle herotext = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.0,
    fontFamily: Fonts.navbar,
    color: Pallete.aliceblue,
  );

  static const TextStyle herospeech = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.0,
    fontFamily: Fonts.navbar,
    color: Pallete.aliceblue,
  );

  static const TextStyle smalltext = TextStyle(
    fontFamily: Fonts.text,
    fontSize: 16.0,
    color: Pallete.aliceblue,
    letterSpacing: 1.0,
  );
}
