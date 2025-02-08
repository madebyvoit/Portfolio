import 'package:flutter/material.dart';
import 'package:portfolio/data/theme/theme_data.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = Theming.darkMode();

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    _themeData == Theming.darkMode()
        ? themeData = Theming.lightMode()
        : themeData = Theming.darkMode();
  }
}
