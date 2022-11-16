import 'package:flutter/material.dart';

class CustomTextFormFields extends StatelessWidget {
  final TextEditingController _textEditingController;
  final String labelText;

  const CustomTextFormFields(
    this._textEditingController, {
    Key? key,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: _textEditingController,
      decoration: InputDecoration(
        labelText: labelText,
      ),
      validator: (value) {
        return value == null ? 'This entry can\'t be null' : null;
      },
    );
  }
}
