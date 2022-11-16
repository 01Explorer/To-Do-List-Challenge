import 'package:flutter/material.dart';
import 'package:to_do_list_challenge/layers/domain/repositories/change_app_theme/change_app_theme_repository.dart';
import 'package:to_do_list_challenge/layers/domain/usecases/change_app_theme/change_app_theme_usecase.dart';

class ChangeAppThemeUsecaseImp implements ChangeAppThemeUsecase {
  final ChangeAppThemeRepository _changeAppThemeRepository;

  ChangeAppThemeUsecaseImp(this._changeAppThemeRepository);
  @override
  ThemeMode call(bool isDark) {
    return _changeAppThemeRepository(isDark);
  }
}
