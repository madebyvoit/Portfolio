import 'package:flutter/material.dart';
import 'package:portfolio/data/configs/configs.dart';

//* font weight deffinitions
const bold = FontWeight.w700;
const semibold = FontWeight.w600;
const medium = FontWeight.w500;
const regular = FontWeight.w400;
const light = FontWeight.w300;

//* lighttheme data
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  canvasColor: AppColors.lightBackground,
  focusColor: AppColors.lightFocus,
  highlightColor: AppColors.lightHighlight,
  colorScheme: const ColorScheme.light(
    surface: AppColors.lightBackground,
    onSurface: AppColors.lightOnBackground,
    primary: AppColors.lightPrimary,
    onPrimary: AppColors.lightOnPrimary,
    primaryContainer: AppColors.lightPrimaryContainer,
    onPrimaryContainer: AppColors.lightOnPrimaryContainer,
    secondary: AppColors.lightSecondary,
    onSecondary: AppColors.lightOnSecondary,
    secondaryContainer: AppColors.lightSecondaryContainer,
    onSecondaryContainer: AppColors.lightOnSecondaryContainer,
    error: AppColors.lightError,
    onError: AppColors.lightOnError,
  ),
  textTheme: TextTheme(
    headlineLarge: Styles.mavenPro(
        color: AppColors.darkOnPrimary, fontSize: 96, fontWeight: bold),
    headlineMedium: Styles.mavenPro(
        color: AppColors.darkOnPrimary, fontSize: 90, fontWeight: bold),
    headlineSmall: Styles.mavenPro(
        color: AppColors.darkOnPrimary, fontSize: 84, fontWeight: bold),
    bodyLarge: Styles.mavenPro(
        color: AppColors.darkOnPrimary, fontSize: 74, fontWeight: bold),
    bodyMedium: Styles.mavenPro(
        color: AppColors.darkOnPrimary, fontSize: 70, fontWeight: bold),
    bodySmall: Styles.mavenPro(
        color: AppColors.darkOnPrimary, fontSize: 64, fontWeight: bold),
    titleLarge: Styles.mavenPro(
        color: AppColors.darkOnPrimary, fontSize: 54, fontWeight: bold),
    titleMedium: Styles.mavenPro(
        color: AppColors.darkOnPrimary, fontSize: 50, fontWeight: bold),
    titleSmall: Styles.mavenPro(
        color: AppColors.darkOnPrimary, fontSize: 44, fontWeight: bold),
    labelLarge: Styles.mavenPro(
        color: AppColors.darkOnPrimary, fontSize: 24, fontWeight: bold),
    labelMedium: Styles.mavenPro(
        color: AppColors.darkOnPrimary, fontSize: 20, fontWeight: bold),
    labelSmall: Styles.mavenPro(
        color: AppColors.darkOnPrimary, fontSize: 14, fontWeight: bold),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.lightAppBarBackground,
    elevation: 0,
    // shadowcolor
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.lightCursorSelection,
    selectionColor: AppColors.lightSelection,
  ),
);

//* darktheme data
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  canvasColor: AppColors.darkBackground,
  focusColor: AppColors.darkFocus,
  highlightColor: AppColors.darkHighlight,
  colorScheme: const ColorScheme.dark(
    surface: AppColors.darkBackground,
    onSurface: AppColors.darkOnBackground,
    primary: AppColors.darkPrimary,
    onPrimary: AppColors.darkOnPrimary,
    primaryContainer: AppColors.darkPrimaryContainer,
    onPrimaryContainer: AppColors.darkOnPrimaryContainer,
    secondary: AppColors.darkSecondary,
    onSecondary: AppColors.darkOnSecondary,
    secondaryContainer: AppColors.darkSecondaryContainer,
    onSecondaryContainer: AppColors.darkOnSecondaryContainer,
    error: AppColors.darkError,
    onError: AppColors.darkOnError,
  ),
  textTheme: TextTheme(
    headlineLarge: Styles.mavenPro(
        color: AppColors.darkOnPrimary, fontSize: 96, fontWeight: bold),
    headlineMedium: Styles.mavenPro(
        color: AppColors.darkOnPrimary, fontSize: 94, fontWeight: bold),
    headlineSmall: Styles.mavenPro(
        color: AppColors.darkOnPrimary, fontSize: 90, fontWeight: bold),
    bodyLarge: Styles.mavenPro(
        color: AppColors.darkOnPrimary, fontSize: 84, fontWeight: bold),
    bodyMedium: Styles.mavenPro(
        color: AppColors.darkOnPrimary, fontSize: 80, fontWeight: bold),
    bodySmall: Styles.mavenPro(
        color: AppColors.darkOnPrimary, fontSize: 74, fontWeight: bold),
    titleLarge: Styles.mavenPro(
        color: AppColors.darkOnPrimary, fontSize: 64, fontWeight: bold),
    titleMedium: Styles.mavenPro(
        color: AppColors.darkOnPrimary, fontSize: 60, fontWeight: bold),
    titleSmall: Styles.mavenPro(
        color: AppColors.darkOnPrimary, fontSize: 54, fontWeight: bold),
    labelLarge: Styles.mavenPro(
        color: AppColors.darkOnPrimary, fontSize: 24, fontWeight: bold),
    labelMedium: Styles.mavenPro(
        color: AppColors.darkOnPrimary, fontSize: 20, fontWeight: bold),
    labelSmall: Styles.mavenPro(
        color: AppColors.darkOnPrimary, fontSize: 14, fontWeight: bold),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.darkAppBarBackground,
    elevation: 0,
    // shadowcolor
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.darkCursorSelection,
    selectionColor: AppColors.darkSelection,
  ),
);
