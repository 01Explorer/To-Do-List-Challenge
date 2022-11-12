import 'package:flutter/material.dart';
import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';
import 'package:to_do_list_challenge/layers/presentation/components/widgets/home_task_screen/custom_list_tile_for_tasks.dart';

class CustomListViewBuilderBasedOnOptions extends StatelessWidget {
  final List<TaskEntity> listWithDesiredTasks;
  const CustomListViewBuilderBasedOnOptions(
      {Key? key, required this.listWithDesiredTasks})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listWithDesiredTasks.length,
      itemBuilder: (BuildContext context, int index) {
        if (listWithDesiredTasks.isNotEmpty) {
          return CustomListTileForTasks(task: listWithDesiredTasks[index]);
        }
        return const Center(
          child: Text('We couldn\'t find anything'),
        );
      },
    );
  }
}
