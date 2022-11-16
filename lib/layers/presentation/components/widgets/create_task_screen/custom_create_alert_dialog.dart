import 'package:flutter/material.dart';

import '../../../pages/tasks/home_task_page.dart';

class CustomCreateAlertDialog extends StatelessWidget {
  const CustomCreateAlertDialog({
    Key? key,
    required TextEditingController descriptionFormFieldController,
    required TextEditingController finishDateFormFieldController,
    required TextEditingController titleFormFieldController,
  })  : _descriptionFormFieldController = descriptionFormFieldController,
        _finishDateFormFieldController = finishDateFormFieldController,
        _titleFormFieldController = titleFormFieldController,
        super(key: key);

  final TextEditingController _descriptionFormFieldController;
  final TextEditingController _finishDateFormFieldController;
  final TextEditingController _titleFormFieldController;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Congrats!'),
      content: const Text(
        'Your task was succesfully created!\nWant to create another one ?',
        textAlign: TextAlign.center,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 120,
              child: ElevatedButton(
                onPressed: () {
                  _descriptionFormFieldController.clear();
                  _finishDateFormFieldController.clear();
                  _titleFormFieldController.clear();
                  Navigator.pop(context);
                },
                child: const Text('Yes!!'),
              ),
            ),
            SizedBox(
              width: 120,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const HomeTaskPage(),
                          fullscreenDialog: true),
                      (route) => false);
                },
                child: const Text('No'),
              ),
            ),
          ],
        )
      ],
    );
  }
}
