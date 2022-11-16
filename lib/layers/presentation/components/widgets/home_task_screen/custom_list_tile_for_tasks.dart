import 'package:flutter/material.dart';
import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';
import 'package:to_do_list_challenge/layers/presentation/components/widgets/home_task_screen/custom_list_tile_pop_up_menu.dart';
import 'package:to_do_list_challenge/layers/presentation/components/widgets/home_task_screen/custom_list_tile_subtitle.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/task_controller.dart';
import 'package:to_do_list_challenge/locator.dart';

import 'custom_list_tile_modal_bottom_sheet.dart';
import 'custom_list_tile_title.dart';

class CustomListTileForTasks extends StatefulWidget {
  final TaskEntity task;
  const CustomListTileForTasks({Key? key, required this.task})
      : super(key: key);

  @override
  State<CustomListTileForTasks> createState() => _CustomListTileForTasksState();
}

class _CustomListTileForTasksState extends State<CustomListTileForTasks> {
  final TaskController _taskController = locator.get<TaskController>();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: CustomListTileTitle(
        task: widget.task,
      ),
      subtitle: CustomListTileSubtitle(_taskController, task: widget.task),
      leading: Checkbox(
        value: widget.task.isCompleted,
        onChanged: (value) => _taskController.changeTaskStatus(widget.task),
      ),
      trailing: CustomListTilePopUpMenu(_taskController, task: widget.task),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return CustomTileModalBottomSheet(
              task: widget.task,
            );
          },
        );
      },
    );
  }
}
