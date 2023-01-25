import 'package:flutter/material.dart';

class CustomTextFormFields extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String? initialValue;
  final String labelText;
  final Function(String)? onChanged;

  const CustomTextFormFields({
    this.textEditingController,
    Key? key,
    required this.labelText,
    this.initialValue,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: textEditingController,
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: labelText,
      ),
      validator: (value) {
        return value == null ? 'This entry can\'t be null' : null;
      },
      onChanged: onChanged,
    );
  }
}
