import 'package:flutter/material.dart';

import '../controllers/theme_manager_controller.dart';
import '../themes/theme_colors.dart';

class ContentDividerContainer extends StatelessWidget {
  const ContentDividerContainer({
    Key? key,
    required ThemeManagerController themeManagerController,
  })  : _themeManagerController = themeManagerController,
        super(key: key);

  final ThemeManagerController _themeManagerController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      decoration: BoxDecoration(
        border: Border.all(
          color: _themeManagerController.themeMode == ThemeMode.dark
              ? ThemeColors.borderDecorationCointainerforHeaderDark
              : ThemeColors.borderDecorationCointainerforHeaderLight,
        ),
      ),
    );
  }
}
