import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list_challenge/layers/presentation/themes/theme_colors.dart';

ThemeData themeToDoDark = ThemeData(
  brightness: Brightness.dark,
  fontFamily: GoogleFonts.inter().fontFamily,
  scaffoldBackgroundColor: ThemeColors.backgorundColorDark,
  primarySwatch: ThemeColors.primaryAppColor,
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 32,
      color: ThemeColors.headerFontColorDark,
    ),
    bodyMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: ThemeColors.headerSubstitleFontColor),
    headlineSmall: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 18,
      color: ThemeColors.sectionTitleFontColorDark,
    ),
    bodySmall: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: ThemeColors.headerFontColorDark),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.all<Color>(
        ThemeColors.checkBoxUnselectedColorDark),
    checkColor:
        MaterialStateProperty.all<Color>(ThemeColors.sectionTitleFontColorDark),
    visualDensity: VisualDensity.compact,
    splashRadius: 20,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: ThemeColors.primaryAppColor,
    iconSize: 32,
  ),
);

ThemeData themeToDoLight = ThemeData(
  brightness: Brightness.light,
  fontFamily: GoogleFonts.inter().fontFamily,
  primarySwatch: ThemeColors.primaryAppColor,
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 32,
      color: ThemeColors.headerFontColorLight,
    ),
    bodyMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: ThemeColors.subtitleTaskTextColorLight),
    headlineSmall: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 18,
      color: ThemeColors.sectionTitleFontColorLight,
    ),
    bodySmall: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: ThemeColors.headerSubstitleFontColor),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor:
        MaterialStateProperty.all<Color>(ThemeColors.headerFontColorDark),
    checkColor:
        MaterialStateProperty.all<Color>(ThemeColors.backgorundColorDark),
    visualDensity: VisualDensity.compact,
    splashRadius: 20,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: ThemeColors.primaryAppColor,
    iconSize: 32,
  ),
);
