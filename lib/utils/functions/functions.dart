import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Functions {
  static void launchUrl(String url) async {
    if (!await launchUrlString(url)) {
      throw Exception('Could not launch $url');
    }
  }

  static Size textSize({
    required String text,
    required TextStyle style,
    required BuildContext context,
  }) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textScaler: const TextScaler.linear(1.2),
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}
