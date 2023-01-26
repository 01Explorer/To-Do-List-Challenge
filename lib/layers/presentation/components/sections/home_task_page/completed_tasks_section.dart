import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_list_challenge/layers/presentation/components/custom_list_view_builder_based_on_options.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/home_controller.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/task_controller.dart';

import '../../../../domain/entities/task_entity.dart';
import '../../no_task_found_handling_widget.dart';

class CompletedTasksSection extends StatelessWidget {
  final TaskController _taskController;
  final HomeController _homeScreenController;

  CompletedTasksSection(this._taskController, this._homeScreenController,
      {Key? key})
      : super(key: key);
  List<TaskEntity> listOfCompletedTasks = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Complete',
              style: Theme.of(context).textTheme.headlineSmall,
            )
          ],
        ),
        SizedBox(
          height: 180.h,
          width: double.infinity.w,
          child: AnimatedBuilder(
            animation: _taskController,
            builder: (BuildContext context, Widget? child) {
              listOfCompletedTasks = _taskController.getCompletedTasks();
              if (listOfCompletedTasks.isNotEmpty) {
                return CustomListViewBuilderBasedOnOptions(
                    listWithDesiredTasks: listOfCompletedTasks);
              }
              return const NoTasksFoundWidget(
                message: 'We couldn\'t find any completed task',
              );
            },
          ),
        ),
      ],
    );
  }
}
