import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static TextStyle mavenPro({
    required Color color,
    required FontWeight fontWeight,
    required double fontSize,
    FontStyle fontStyle = FontStyle.normal,
  }) {
    return GoogleFonts.mavenPro(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }
}
