import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/task_controller.dart';
import 'package:to_do_list_challenge/layers/presentation/pages/tasks/home_task_page.dart';
import 'package:to_do_list_challenge/locator.dart';

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
              'New Task',
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
                        result = locator.get<TaskController>().createTask(
                              _titleFormFieldController.text,
                              _descriptionFormFieldController.text,
                              pickedDate ?? DateTime.now(),
                            );
                        if (result) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Congrats!'),
                              content: Text(
                                  'Your task was succesfully created!\nWant to create another one ?'),
                              actions: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        _descriptionFormFieldController.clear();
                                        _finishDateFormFieldController.clear();
                                        _titleFormFieldController.clear();
                                        Navigator.pop(context);
                                      },
                                      child: Text('Yes!!'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const HomeTaskPage(),
                                                    fullscreenDialog: true),
                                                (route) => false);
                                      },
                                      child: Text('No'),
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
                                'A task with this title already exists, try with another one',
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
                      child: const Text('Add Task'),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
