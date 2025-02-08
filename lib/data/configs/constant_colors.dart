import 'package:flutter/material.dart';
import 'package:portfolio/utils/extensions/extensions.dart';

const Color kPrimary = Color(0xFF1E2025); 
const Color kSecondary = Color(0xFF5A7480); 
const Color kPrimaryMedium = Color(0xFF29343D); 
final Color kCoffee = '#6f4e37'.toColor();
const Color kTransparent = Colors.transparent;
const Color kTeal = Colors.teal;
final Color kTeal200 = Colors.teal.shade200;
const Color kBlossom = Color(0xFF50B7CD);
const Color kWhite = Colors.white;
const Color kBlack = Colors.black;
const Color kBlack12 = Colors.black12;
const Color kBlack26  = Colors.black26;
const Color kDeepBlack = Color(0xFF1F1E2F);
final Color kGrey50 = Colors.grey.shade50;
final Color kGrey100 = Colors.grey.shade100;
final Color kGrey300 = Colors.grey.shade300;
final Color kGrey500 = Colors.grey.shade500;
const Color kGrey = Colors.grey;
final Color kBlue50 = Colors.blue.shade50;
const Color kYellow = Colors.yellow;
final Color kYellow300 = Colors.yellow.shade300;
const Color kGreen = Colors.green;
final Color kGreen100 = Colors.green.shade100;
const Color kRed = Colors.red;
final Color kRed100 = Colors.red.shade100;
final Color kIndigo100 = Colors.indigo.shade100;

List<Color> kMenuColors = [
  kSecondary,
  kGreen100,
  kBlossom,
  kYellow300,
  kBlack26,
  kIndigo100,
];

List<Color> kToolColors = [
  kTeal200,
  kRed100,
  kIndigo100,
  kBlue50,
];

class AppColors {
  //* light Theme
  static const Color lightPrimary = Color(0xFFF9F9F9);
  static const Color lightPrimaryContainer = Color(0xFFF9F9F9);
  static const Color lightSecondary = Color(0xFFF9F9F9);
  static const Color lightSecondaryContainer = Color(0xFFF9F9F9);
  static const Color lightBackground = Color(0xFFF9F9F9);

  static const Color lightOnPrimary = Color(0xFFF9F9F9);
  static const Color lightOnPrimaryContainer = Color(0xFFF9F9F9);
  static const Color lightOnSecondary = Color(0xFFF9F9F9);
  static const Color lightOnSecondaryContainer = Color(0xFFF9F9F9);
  static const Color lightOnBackground = Color(0xFFF9F9F9);

  static const Color lightHighlight = Color(0xFFF9F9F9);
  static const Color lightFocus = Color(0xFFF9F9F9);

  static const Color lightError = Color(0xfffb3640);
  static const Color lightOnError = Color(0xFFF9F9F9);

  static const Color lightCursorSelection = Color(0xFFF9F9F9);
  static const Color lightSelection = Color(0xFFF9F9F9);

  static const Color lightAppBarBackground = Color(0xFFF9F9F9);


  //* dark Theme
  static const Color darkPrimary = Color(0xFF121212); //Antrazitgrau
  static const Color darkPrimaryContainer = Color(0xFF2A5D47); //Dark Forest Green
  static const Color darkSecondary = Color(0xFF1E2A23); //Olive grau
  static const Color darkSecondaryContainer = Color(0xFF5DA36B); //Smaraggrau
  static const Color darkBackground = Color(0xFF01030D);

  static const Color darkOnPrimary = Color(0xFFEAEAEA);
  static const Color darkOnPrimaryContainer = Color(0xFFEAEAEA);
  static const Color darkOnSecondary = Color(0xFFEAEAEA);
  static const Color darkOnSecondaryContainer = Color(0xFF121212);
  static const Color darkOnBackground = Color(0xFFEAEAEA);

  static const Color darkHighlight = Color(0xFFEAEAEA);
  static const Color darkFocus = Color(0xFF376A37);

  static const Color darkError = Color(0xffcc2936);
  static const Color darkOnError = Color(0xFFF9F9F9);

  static const Color darkCursorSelection = Color(0xFFF9F9F9);
  static const Color darkSelection = Color(0xFFF9F9F9);

  static const Color darkAppBarBackground = Color(0xFFF9F9F9);

  //*custom Colors
  static const Color loadingLineColor = Color(0xFFEAEAEA);
  static const Color loadingBackground = Color(0xFF121212);
}
