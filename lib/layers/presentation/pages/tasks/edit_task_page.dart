import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';
import 'package:to_do_list_challenge/layers/presentation/components/content_divider_container.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/task_controller.dart';
import 'package:to_do_list_challenge/layers/presentation/pages/tasks/home_task_page.dart';
import 'package:to_do_list_challenge/locator.dart';

import '../../components/custom_text_form_fields.dart';
import '../../components/go_back_button.dart';

class EditTaskPage extends StatelessWidget {
  final TaskEntity task;
  EditTaskPage({Key? key, required this.task}) : super(key: key);

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
    String initialTitle = task.title;
    _titleFormFieldController.text = task.title;
    _descriptionFormFieldController.text = task.description;
    _finishDateFormFieldController.text =
        DateFormat('dd/MM/yyyy').format(task.expiryDate);
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
              'Edit Task',
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
                      _titleFormFieldController,
                      labelText: 'Title',
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomTextFormFields(
                      _descriptionFormFieldController,
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
                          task.title = _titleFormFieldController.text;
                          task.description =
                              _descriptionFormFieldController.text;
                          task.expiryDate = pickedDate ?? task.expiryDate;
                          result = locator
                              .get<TaskController>()
                              .editTask(task, initialTitle);
                          if (result) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Congrats!'),
                                content: const Text(
                                    'Your task was succesfully edited!'),
                                actions: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 300,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            _descriptionFormFieldController
                                                .clear();
                                            _finishDateFormFieldController
                                                .clear();
                                            _titleFormFieldController.clear();
                                            Navigator.of(context)
                                                .pushAndRemoveUntil(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const HomeTaskPage(),
                                                    ),
                                                    (route) => false);
                                          },
                                          child: const Text('Close'),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Sorry for that'),
                                content: const Text(
                                  'Your task couldn\'t be edited',
                                ),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text('Close'))
                                ],
                              ),
                            );
                          }
                        },
                        child: const Text('Edit Task'),
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
