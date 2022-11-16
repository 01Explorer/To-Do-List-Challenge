import 'package:flutter/material.dart';

class CustomErrorAlertDialog extends StatelessWidget {
  final String mainMessage;
  const CustomErrorAlertDialog({
    Key? key,
    required this.mainMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Sorry for that'),
      content: Text(
        mainMessage,
        textAlign: TextAlign.center,
      ),
      actions: [
        Center(
          child: SizedBox(
            width: 300,
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ),
        )
      ],
    );
  }
}
