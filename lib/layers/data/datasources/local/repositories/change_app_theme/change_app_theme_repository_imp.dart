import 'package:flutter/material.dart';
import 'package:to_do_list_challenge/layers/domain/repositories/change_app_theme/change_app_theme_repository.dart';
import 'package:to_do_list_challenge/layers/domain/services/save_local.dart';

class ChangeAppThemeRepositoryImp implements ChangeAppThemeRepository {
  final SaveLocal saveLocal;

  ChangeAppThemeRepositoryImp(this.saveLocal);
  @override
  ThemeMode call(bool isDark) {
    saveLocal.setBool('themeIsDark', isDark);
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  @override
  ThemeMode getTheme() {
    bool? response = saveLocal.getBool('themeIsDark');
    if (response == null) {
      return ThemeMode.light;
    }
    return response ? ThemeMode.dark : ThemeMode.light;
  }
}
