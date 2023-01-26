import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/home_controller.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/task_controller.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/theme_manager_controller.dart';

import 'package:to_do_list_challenge/locator.dart';

import '../../content_divider_container.dart';
import '../../widgets/home_task_screen/number_of_complete_and_incomplete_tasks_row.dart';

class HomeTaskPageHeader extends StatelessWidget {
  final HomeController _homeScreenController;
  final TaskController _taskController;
  HomeTaskPageHeader(this._homeScreenController, this._taskController,
      {Key? key})
      : super(key: key);

  final ThemeManagerController _themeManagerController =
      locator.get<ThemeManagerController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _homeScreenController.getFormattedInitialDate(),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(
                width: 48.w,
                height: 48.h,
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 120.h,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20.r)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Dark Mode',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                Switch(
                                    value: _themeManagerController.themeMode ==
                                        ThemeMode.dark,
                                    onChanged: (value) {
                                      locator
                                          .get<ThemeManagerController>()
                                          .toggleTheme(value);
                                    })
                              ],
                            ),
                          );
                        });
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.white54,
                    backgroundImage:
                        AssetImage('assets/images/example_image.png'),
                  ),
                ))
          ],
        ),
        Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: AnimatedBuilder(
              animation: _taskController,
              builder: (context, child) =>
                  NumberOfCompleteAndIncompleteTasksRow(_taskController),
            )),
        ContentDividerContainer(
            themeManagerController: _themeManagerController),
      ],
    );
  }
}
