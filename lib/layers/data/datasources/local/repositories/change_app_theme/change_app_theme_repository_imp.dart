import 'package:flutter/material.dart';
import 'package:to_do_list_challenge/layers/domain/repositories/change_app_theme/change_app_theme_repository.dart';

class ChangeAppThemeRepositoryImp implements ChangeAppThemeRepository {
  @override
  ThemeMode call(bool isDark) {
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }
}
