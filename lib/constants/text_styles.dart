import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/fonts.dart';

class CustomStyle {
  CustomStyle._();

  static const TextStyle logo = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.0,
    fontFamily: Fonts.aquateScript,
    color: Pallete.aliceblue,
  );

  static const TextStyle menuItem = TextStyle(
    fontFamily: Fonts.inconsolata,
    fontSize: 16.0,
    color: Pallete.aliceblue,
    letterSpacing: 1.0,
  );
}
