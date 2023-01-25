import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_challenge/layers/presentation/components/content_divider_container.dart';
import 'package:to_do_list_challenge/layers/presentation/components/custom_text_form_fields.dart';
import 'package:to_do_list_challenge/layers/presentation/components/go_back_button.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/task_controller.dart';
import 'package:to_do_list_challenge/locator.dart';

import '../../components/widgets/create_task_screen/custom_create_alert_dialog.dart';
import '../../components/widgets/create_task_screen/custom_error_alert_dialog.dart';

class CreateTaskPage extends StatelessWidget {
  CreateTaskPage({Key? key}) : super(key: key);

  final GlobalKey _formsKey = GlobalKey<FormState>();
  final TextEditingController _titleFormFieldController =
      TextEditingController();
  final TextEditingController _descriptionFormFieldController =
      TextEditingController();
  final TextEditingController _finishDateFormFieldController =
      TextEditingController();

  DateTime? pickedDate;
  bool result = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 55, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GoBackButton(),
            const SizedBox(
              height: 16,
            ),
            Text(
              'New Task',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 8,
            ),
            ContentDividerContainer(themeManagerController: locator()),
            const SizedBox(
              height: 16,
            ),
            Form(
                key: _formsKey,
                child: Column(
                  children: [
                    CustomTextFormFields(
                      textEditingController: _titleFormFieldController,
                      labelText: 'Title',
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomTextFormFields(
                      textEditingController: _descriptionFormFieldController,
                      labelText: 'Description',
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.none,
                      controller: _finishDateFormFieldController,
                      decoration: const InputDecoration(
                        labelText: 'Finish date',
                        suffixIcon: Icon(Icons.calendar_month),
                      ),
                      onTap: () async {
                        pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2021),
                          lastDate: DateTime(2025),
                        );
                        if (pickedDate != null) {
                          String formattedDate =
                              DateFormat('dd/MM/yyyy').format(pickedDate!);
                          _finishDateFormFieldController.text = formattedDate;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_titleFormFieldController.text.isNotEmpty &&
                              _descriptionFormFieldController.text.isNotEmpty) {
                            result = locator.get<TaskController>().createTask(
                                  _titleFormFieldController.text,
                                  _descriptionFormFieldController.text,
                                  pickedDate ?? DateTime.now(),
                                );
                          }
                          if (result) {
                            showDialog(
                              context: context,
                              builder: (context) => CustomCreateAlertDialog(
                                  descriptionFormFieldController:
                                      _descriptionFormFieldController,
                                  finishDateFormFieldController:
                                      _finishDateFormFieldController,
                                  titleFormFieldController:
                                      _titleFormFieldController),
                            );
                          }
                          if (result == false &&
                              (_titleFormFieldController.text.isEmpty ||
                                  _descriptionFormFieldController
                                      .text.isEmpty)) {
                            showDialog(
                              context: context,
                              builder: (context) =>
                                  const CustomErrorAlertDialog(
                                mainMessage:
                                    'The Title or Description fields are empty',
                              ),
                            );
                          }
                          if (result == false &&
                              (_titleFormFieldController.text.isNotEmpty ||
                                  _descriptionFormFieldController
                                      .text.isNotEmpty)) {
                            showDialog(
                              context: context,
                              builder: (context) =>
                                  const CustomErrorAlertDialog(
                                mainMessage:
                                    'There\'s already a task with this Title, try with another one',
                              ),
                            );
                          }
                        },
                        child: const Text('Add Task'),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
