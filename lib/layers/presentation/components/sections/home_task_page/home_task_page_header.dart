import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/home_controller.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/land_page_controller.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/task_controller.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/theme_manager_controller.dart';

import 'package:to_do_list_challenge/locator.dart';

import '../../content_divider_container.dart';
import '../../widgets/home_task_screen/custom_modal_bottom_sheet.dart';
import '../../widgets/home_task_screen/number_of_complete_and_incomplete_tasks_row.dart';

class HomeTaskPageHeader extends StatefulWidget {
  final HomeController _homeScreenController;
  final TaskController _taskController;

  const HomeTaskPageHeader(this._homeScreenController, this._taskController,
      {Key? key})
      : super(key: key);

  @override
  State<HomeTaskPageHeader> createState() => _HomeTaskPageHeaderState();
}

class _HomeTaskPageHeaderState extends State<HomeTaskPageHeader> {
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
              widget._homeScreenController.getFormattedInitialDate(),
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
                          return CustomModalBottomSheet();
                        }).then((value) {
                      setState(() {});
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text(
                      locator.get<LandPageController>().getUser() != null ||
                              locator
                                  .get<LandPageController>()
                                  .getUser()!
                                  .isNotEmpty
                          ? locator
                              .get<LandPageController>()
                              .getUser()![0]
                              .toUpperCase()
                          : 'G',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(fontSize: 24),
                    ),
                  ),
                ))
          ],
        ),
        Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: AnimatedBuilder(
              animation: widget._taskController,
              builder: (context, child) =>
                  NumberOfCompleteAndIncompleteTasksRow(widget._taskController),
            )),
        ContentDividerContainer(
            themeManagerController: _themeManagerController),
      ],
    );
  }
}
