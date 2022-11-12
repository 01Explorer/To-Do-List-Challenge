import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/task_controller.dart';
import 'package:to_do_list_challenge/layers/presentation/pages/tasks/home_task_page.dart';
import 'package:to_do_list_challenge/locator.dart';

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
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                    ),
                  ),
                  Text('To go back'),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Edit Task',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              height: 2,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(255, 255, 255, 0.05),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Form(
                key: _formsKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _titleFormFieldController,
                      decoration: const InputDecoration(
                        labelText: 'Title',
                        filled: true,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: _descriptionFormFieldController,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        filled: true,
                      ),
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
                        filled: true,
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
                    ElevatedButton(
                      onPressed: () {
                        task.title = _titleFormFieldController.text;
                        task.description = _descriptionFormFieldController.text;
                        task.expiryDate = pickedDate ?? task.expiryDate;
                        result = locator
                            .get<TaskController>()
                            .editTask(task, initialTitle);
                        if (result) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Congrats!'),
                              content:
                                  Text('Your task was succesfully edited!'),
                              actions: [
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        _descriptionFormFieldController.clear();
                                        _finishDateFormFieldController.clear();
                                        _titleFormFieldController.clear();
                                        Navigator.pop(context);
                                      },
                                      child: Text('Close'),
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
                              title: Text('Sorry for that'),
                              content: Text(
                                'Your task couldn\'t be edited',
                              ),
                              actions: [
                                ElevatedButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: Text('Close'))
                              ],
                            ),
                          );
                        }
                      },
                      child: const Text('Edit Task'),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
