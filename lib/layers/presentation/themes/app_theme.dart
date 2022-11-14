import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list_challenge/layers/presentation/themes/theme_colors.dart';

ThemeData themeToDo = ThemeData(
  brightness: Brightness.dark,
  fontFamily: GoogleFonts.inter().fontFamily,
  scaffoldBackgroundColor: ThemeColors.backgorundColor,
  primarySwatch: ThemeColors.primaryAppColor,
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 32,
      color: ThemeColors.headerFontColor,
    ),
    bodyMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: ThemeColors.headerSubstitleFontColor),
    headlineSmall: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 18,
      color: ThemeColors.sectionTitleFontColor,
    ),
    bodySmall: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: ThemeColors.headerFontColor),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor:
        MaterialStateProperty.all<Color>(ThemeColors.checkBoxUnselectedColor),
    checkColor:
        MaterialStateProperty.all<Color>(ThemeColors.sectionTitleFontColor),
    visualDensity: VisualDensity.compact,
    splashRadius: 20,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: ThemeColors.primaryAppColor,
    iconSize: 32,
  ),
);
