import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';
import 'package:to_do_list_challenge/layers/presentation/components/content_divider_container.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/task_controller.dart';
import 'package:to_do_list_challenge/layers/presentation/pages/tasks/home_task_page.dart';
import 'package:to_do_list_challenge/locator.dart';

import '../../components/custom_text_form_fields.dart';
import '../../components/go_back_button.dart';

class EditTaskPage extends StatefulWidget {
  final TaskEntity task;
  const EditTaskPage({Key? key, required this.task}) : super(key: key);

  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  final GlobalKey _formsKey = GlobalKey<FormState>();
  late final String initialTitle;
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _expiryDateController;

  @override
  void initState() {
    super.initState();
    initialTitle = widget.task.title.toLowerCase();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _expiryDateController = TextEditingController();
    _titleController.text = widget.task.title;
    _descriptionController.text = widget.task.description;
    _expiryDateController.text =
        DateFormat('dd/MM/yyyy').format(widget.task.expiryDate);
  }

  DateTime? pickedDate;

  bool result = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                      labelText: 'Title',
                      textEditingController: _titleController,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomTextFormFields(
                      labelText: 'Description',
                      textEditingController: _descriptionController,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: _expiryDateController,
                      keyboardType: TextInputType.none,
                      decoration: const InputDecoration(
                        labelText: 'Finish date',
                        suffixIcon: Icon(Icons.calendar_month),
                      ),
                      onTap: () async {
                        pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2023),
                          lastDate: DateTime(2025),
                        );
                        if (pickedDate != null) {
                          _expiryDateController.text =
                              DateFormat('dd/MM/yyyy').format(pickedDate!);
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
                          widget.task.title = _titleController.text;
                          widget.task.description = _descriptionController.text;
                          widget.task.expiryDate =
                              pickedDate ?? widget.task.expiryDate;
                          result = locator
                              .get<TaskController>()
                              .editTask(widget.task, initialTitle);
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
