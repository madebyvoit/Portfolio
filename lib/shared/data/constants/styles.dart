part of '../constants.dart';

class CustomStyle {
  static TextStyle bebasneue({
    final Color color = Colors.white,
    final double fontSize = 21,
    FontWeight fontWeight = FontWeight.w600,
    FontStyle fontStyle = FontStyle.normal,
  }) {
    return GoogleFonts.bebasNeue(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }

  static TextStyle mavenpro({
    final Color color = Colors.white,
    final double fontSize = 18,
    FontWeight fontWeight = FontWeight.w600,
    FontStyle fontStyle = FontStyle.normal,
  }) {
    return GoogleFonts.mavenPro(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }

  static TextStyle lora({
    final Color color = Colors.white,
    FontWeight fontWeight = FontWeight.w100,
    double fontSize = 14,
    FontStyle fontStyle = FontStyle.normal,
  }) {
    return GoogleFonts.lora(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }

  static TextStyle mono({
    final Color color = Colors.white,
    FontWeight fontWeight = FontWeight.w300,
    double fontSize = 14,
    FontStyle fontStyle = FontStyle.normal,
  }) {
    return GoogleFonts.jetBrainsMono(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }
}
