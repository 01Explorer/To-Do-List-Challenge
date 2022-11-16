import 'package:flutter/material.dart';
import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/task_controller.dart';

import '../../../pages/tasks/edit_task_page.dart';

enum SampleItem { edit, remove }

class CustomListTilePopUpMenu extends StatelessWidget {
  final TaskEntity task;
  final TaskController _taskController;
  const CustomListTilePopUpMenu(
    this._taskController, {
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SampleItem? selectedMenu;
    return PopupMenuButton(
      initialValue: selectedMenu,
      onSelected: (SampleItem item) {
        if (selectedMenu == SampleItem.edit) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EditTaskPage(task: task),
            ),
          );
        }
        if (selectedMenu == SampleItem.remove) {
          _taskController.deleteTask(task);
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
        PopupMenuItem(
          value: SampleItem.edit,
          child: Row(
            children: const [
              Icon(Icons.edit),
              Text('Edit'),
            ],
          ),
          onTap: () => selectedMenu = SampleItem.edit,
        ),
        PopupMenuItem(
          value: SampleItem.edit,
          child: Row(
            children: const [
              Icon(Icons.delete),
              Text('Delete'),
            ],
          ),
          onTap: () => selectedMenu = SampleItem.remove,
        ),
      ],
    );
  }
}
