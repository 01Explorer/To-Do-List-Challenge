import 'package:flutter/material.dart';

class NoTasksFoundWidget extends StatelessWidget {
  final String message;
  const NoTasksFoundWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        textAlign: TextAlign.center,
      ),
    );
  }
}
