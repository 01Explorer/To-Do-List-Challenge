import 'package:flutter/material.dart';
import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';

import '../../../themes/theme_colors.dart';

class CustomListTileTitle extends StatelessWidget {
  final TaskEntity task;
  const CustomListTileTitle({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      task.title,
      style: task.isCompleted
          ? Theme.of(context).textTheme.bodySmall!.copyWith(
              color: ThemeColors.headerSubstitleFontColor.withOpacity(0.6))
          : Theme.of(context).textTheme.bodySmall,
    );
  }
}
