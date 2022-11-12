import 'package:flutter/material.dart';
import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/task_controller.dart';
import 'package:to_do_list_challenge/locator.dart';
import 'package:intl/intl.dart';

import '../../../pages/tasks/edit_task_page.dart';

enum SampleItem { edit, remove }

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
    SampleItem? selectedMenu;
    return ListTile(
      title: Text(widget.task.title),
      subtitle: widget.task.isCompleted
          ? const Text(
              'Finished',
            )
          : Row(
              children: [
                Text(
                  setTaskDaysRemainingSubtitle(),
                  style: TextStyle(
                      color: locator
                          .get<TaskController>()
                          .getSubtitle(widget.task)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                      'on ${DateFormat('dd/MM/yyyy').format(widget.task.expiryDate)}'),
                )
              ],
            ),
      leading: Checkbox(
        value: widget.task.isCompleted,
        onChanged: (value) => _taskController.changeTaskStatus(widget.task),
      ),
      trailing: PopupMenuButton(
        initialValue: selectedMenu,
        onSelected: (SampleItem item) {
          if (selectedMenu == SampleItem.edit) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EditTaskPage(task: widget.task),
              ),
            );
          }
          if (selectedMenu == SampleItem.remove) {
            ScaffoldMessenger(
                child: SnackBar(
                    content: _taskController.deleteTask(widget.task)
                        ? Text('Task Successfuly Deleted')
                        : Text('Couldn\'t Delete the desired Task')));
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
      ),
    );
  }

  String setTaskDaysRemainingSubtitle() {
    return widget.task.daysToFinishTask() >= 0
        ? '${widget.task.daysToFinishTask()} days to finish'
        : '${widget.task.daysToFinishTask() * -1} days late';
  }
}
