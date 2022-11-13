import 'package:flutter/material.dart';

import '../../../pages/tasks/create_task_page.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      clipBehavior: Clip.hardEdge,
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CreateTaskPage(), fullscreenDialog: true),
      ),
      child: const Icon(Icons.add),
    );
  }
}
