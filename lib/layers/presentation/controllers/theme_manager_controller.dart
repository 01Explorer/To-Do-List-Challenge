import 'package:flutter/material.dart';
import 'package:to_do_list_challenge/layers/domain/usecases/change_app_theme/change_app_theme_usecase.dart';

class ThemeManagerController extends ChangeNotifier {
  final ChangeAppThemeUsecase _appThemeUsecase;
  ThemeMode _themeMode = ThemeMode.system;

  ThemeManagerController(this._appThemeUsecase) {
    _themeMode = _appThemeUsecase.getTheme();
  }

  get themeMode => _themeMode;

  toggleTheme(bool isDark) {
    _themeMode = _appThemeUsecase(isDark);
    notifyListeners();
  }
}
