import 'package:flutter/material.dart';

abstract class ChangeAppThemeUsecase {
  ThemeMode call(bool isDark);
}
