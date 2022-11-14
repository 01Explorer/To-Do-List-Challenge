import 'package:flutter/material.dart';
import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/task_controller.dart';

class NumberOfCompleteAndIncompleteTasksRow extends StatelessWidget {
  final TaskController _taskController;
  const NumberOfCompleteAndIncompleteTasksRow(this._taskController, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TaskEntity> incompleteTasksList = _taskController.getIncompleteTasks();
    List<TaskEntity> completeTasksList = _taskController.getCompletedTasks();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tasks: ${incompleteTasksList.length} incompletes and ${completeTasksList.length} done',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
