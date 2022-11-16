import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/task_controller.dart';

import '../../../themes/theme_colors.dart';

class CustomListTileSubtitle extends StatelessWidget {
  final TaskController _taskController;
  final TaskEntity task;
  const CustomListTileSubtitle(this._taskController,
      {Key? key, required this.task})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return task.isCompleted
        ? Text(
            'Finished',
            style: task.isCompleted
                ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color:
                        ThemeColors.headerSubstitleFontColor.withOpacity(0.6))
                : Theme.of(context).textTheme.bodyMedium,
          )
        : Row(
            children: [
              Text(
                setTaskDaysRemainingSubtitle(),
                style: TextStyle(color: _taskController.getSubtitle(task)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'on ${DateFormat('dd/MM/yyyy').format(task.expiryDate)}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            ],
          );
  }

  String setTaskDaysRemainingSubtitle() {
    return task.daysToFinishTask() >= 0
        ? '${task.daysToFinishTask()} days to finish'
        : '${task.daysToFinishTask() * -1} days late';
  }
}
