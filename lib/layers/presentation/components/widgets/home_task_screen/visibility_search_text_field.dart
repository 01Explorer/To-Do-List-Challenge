import 'package:flutter/material.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/home_controller.dart';

class VisibilitySearchTextField extends StatelessWidget {
  final HomeController _homeScreenController;
  const VisibilitySearchTextField(this._homeScreenController, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _homeScreenController,
      builder: (_, child) {
        return Visibility(
          visible: _homeScreenController.isVisible,
          child: TextField(
            decoration: const InputDecoration(
              label: Text('Search'),
            ),
            onChanged: (value) {
              _homeScreenController.setsearchTermForTitleFiltering(value);
            },
          ),
        );
      },
    );
  }
}
