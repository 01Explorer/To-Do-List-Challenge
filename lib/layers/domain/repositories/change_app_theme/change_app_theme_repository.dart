import 'package:flutter/material.dart';

abstract class ChangeAppThemeRepository {
  ThemeMode call(bool isDark);
  ThemeMode getTheme();
}
