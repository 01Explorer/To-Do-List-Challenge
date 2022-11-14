import 'package:flutter/material.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/home_controller.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/task_controller.dart';

import '../../widgets/home_task_screen/number_of_complete_and_incomplete_tasks_row.dart';

class HomeTaskPageHeader extends StatelessWidget {
  final HomeController _homeScreenController;
  final TaskController _taskController;
  const HomeTaskPageHeader(this._homeScreenController, this._taskController,
      {Key? key})
      : super(key: key);

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
            const SizedBox(
                width: 48,
                height: 48,
                child: CircleAvatar(
                  backgroundColor: Colors.white54,
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
        Container(
          height: 2,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromRGBO(255, 255, 255, 0.05),
            ),
          ),
        ),
      ],
    );
  }
}
