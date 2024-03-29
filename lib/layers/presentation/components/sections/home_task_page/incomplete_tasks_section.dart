import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_challenge/layers/presentation/components/no_task_found_handling_widget.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/home_controller.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/task_controller.dart';

import '../../custom_list_view_builder_based_on_options.dart';

class IncompleteTasksSection extends StatelessWidget {
  final HomeController _homeScreenController;
  final TaskController _taskController;
  const IncompleteTasksSection(this._homeScreenController, this._taskController,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Incomplete',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            IconButton(
              onPressed: () {
                _homeScreenController.setVisibilityOnIconClick();
              },
              icon: const Icon(
                Icons.search,
              ),
            ),
            IconButton(
              onPressed: () {
                // _homeScreenController.newRangeToFilter =
                showDateRangePicker(
                        context: context,
                        firstDate: DateTime(2021),
                        lastDate: DateTime(2025))
                    .then((value) {
                  if (value != null) {
                    return _homeScreenController.setNewRangeToFilter(value);
                  }
                });
              },
              icon: const Icon(
                Icons.calendar_month,
              ),
            ),
            AnimatedBuilder(
              animation: _homeScreenController,
              builder: (context, child) {
                return Visibility(
                    visible: _homeScreenController.newRangeToFilter != null,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () => _homeScreenController
                                .resetDateBetweenFiltering(),
                            icon: const Icon(Icons.refresh)),
                        Text(
                          _homeScreenController.newRangeToFilter != null
                              ? 'Filtered from\n ${DateFormat('dd/MM/yy').format(_homeScreenController.newRangeToFilter!.start)} to ${DateFormat('dd/MM/yy').format(_homeScreenController.newRangeToFilter!.end)}'
                              : '',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 10),
                        ),
                      ],
                    ));
              },
            )
          ],
        ),
        SizedBox(
          height: 180.h,
          width: double.infinity.w,
          child: AnimatedBuilder(
            animation:
                Listenable.merge([_taskController, _homeScreenController]),
            builder: (BuildContext context, Widget? child) {
              return returnTheListViewBuilderForIncompleteSectionBasedOnPageSettings();
            },
          ),
        ),
      ],
    );
  }

  Widget returnTheListViewBuilderForIncompleteSectionBasedOnPageSettings() {
    if (_homeScreenController.isVisible) {
      _homeScreenController.setListOfTasksIncomplete(
          _taskController.getTasksFilteredByTitle(
              _homeScreenController.searchTermForTitleFiltering));
      if (_homeScreenController.getListOfTasksIncomplete().isEmpty) {
        return const NoTasksFoundWidget(message: 'Couldn\'t find any task');
      }
      return CustomListViewBuilderBasedOnOptions(
          listWithDesiredTasks:
              _homeScreenController.getListOfTasksIncomplete());
    }
    if (_homeScreenController.newRangeToFilter != null) {
      _homeScreenController.setListOfTasksIncomplete(
          _taskController.getTasksFilteredByDateBetween(
        _homeScreenController.newRangeToFilter!.start,
        _homeScreenController.newRangeToFilter!.end,
      ));
      if (_homeScreenController.getListOfTasksIncomplete().isEmpty) {
        return const NoTasksFoundWidget(
            message: 'Couldn\'t find any task between those dates');
      }
      return CustomListViewBuilderBasedOnOptions(
          listWithDesiredTasks:
              _homeScreenController.getListOfTasksIncomplete());
    }
    _homeScreenController
        .setListOfTasksIncomplete(_taskController.getIncompleteTasks());
    if (_homeScreenController.getListOfTasksIncomplete().isEmpty) {
      return const NoTasksFoundWidget(
          message: 'There are no Incomplete tasks\n Try adding a new one');
    }
    return CustomListViewBuilderBasedOnOptions(
        listWithDesiredTasks: _homeScreenController.getListOfTasksIncomplete());
  }
}
