import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../locator.dart';
import '../../../../domain/entities/task_entity.dart';
import '../../content_divider_container.dart';

class CustomTileModalBottomSheet extends StatelessWidget {
  const CustomTileModalBottomSheet({
    Key? key,
    required this.task,
  }) : super(key: key);

  final TaskEntity task;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            ContentDividerContainer(themeManagerController: locator()),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Description:',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            ContentDividerContainer(themeManagerController: locator()),
            const SizedBox(
              height: 8,
            ),
            Text(
              task.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Due Date:',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            ContentDividerContainer(themeManagerController: locator()),
            const SizedBox(
              height: 8,
            ),
            Text(
              DateFormat('dd/MM/yyyy').format(task.expiryDate),
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ),
    );
  }
}
