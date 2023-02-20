import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/home_controller.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/land_page_controller.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/task_controller.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/theme_manager_controller.dart';

import 'package:to_do_list_challenge/locator.dart';

import '../../content_divider_container.dart';
import '../../widgets/home_task_screen/number_of_complete_and_incomplete_tasks_row.dart';

class HomeTaskPageHeader extends StatefulWidget {
  final HomeController _homeScreenController;
  final TaskController _taskController;

  const HomeTaskPageHeader(this._homeScreenController, this._taskController,
      {Key? key})
      : super(key: key);

  @override
  State<HomeTaskPageHeader> createState() => _HomeTaskPageHeaderState();
}

class _HomeTaskPageHeaderState extends State<HomeTaskPageHeader> {
  final TextEditingController nameEditControlle = TextEditingController();

  final ThemeManagerController _themeManagerController =
      locator.get<ThemeManagerController>();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget._homeScreenController.getFormattedInitialDate(),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(
                width: 48.w,
                height: 48.h,
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 120.h,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20.r)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Dark Mode',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    Switch(
                                        value:
                                            _themeManagerController.themeMode ==
                                                ThemeMode.dark,
                                        onChanged: (value) {
                                          locator
                                              .get<ThemeManagerController>()
                                              .toggleTheme(value);
                                        })
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () => showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.3,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Edit your name',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                height: 16,
                                              ),
                                              Form(
                                                key: formKey,
                                                child: TextFormField(
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  keyboardType:
                                                      TextInputType.name,
                                                  decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  )),
                                                  validator: (value) {
                                                    if (value!.length > 1) {
                                                      nameEditControlle.text =
                                                          value;
                                                      return null;
                                                    }
                                                    return 'Try a valid name';
                                                  },
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 16,
                                              ),
                                              Flexible(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      style: Theme.of(context)
                                                          .elevatedButtonTheme
                                                          .style,
                                                      child: Text(
                                                        'Cancel',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall!
                                                            .copyWith(
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        if (formKey
                                                            .currentState!
                                                            .validate()) {
                                                          locator
                                                              .get<
                                                                  LandPageController>()
                                                              .signUser(
                                                                  nameEditControlle
                                                                      .text);
                                                          Navigator.pop(
                                                              context);
                                                          Navigator.pop(
                                                              context);
                                                          setState(() {});
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  const SnackBar(
                                                                      content: Text(
                                                                          'Name changed!')));
                                                        }
                                                      },
                                                      style: Theme.of(context)
                                                          .elevatedButtonTheme
                                                          .style,
                                                      child: Text(
                                                        'Confirm',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall!
                                                            .copyWith(
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  style: Theme.of(context)
                                      .elevatedButtonTheme
                                      .style,
                                  child: Text(
                                    'Edit user name',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text(
                      locator
                          .get<LandPageController>()
                          .getUser()![0]
                          .toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(fontSize: 24),
                    ),
                  ),
                ))
          ],
        ),
        Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: AnimatedBuilder(
              animation: widget._taskController,
              builder: (context, child) =>
                  NumberOfCompleteAndIncompleteTasksRow(widget._taskController),
            )),
        ContentDividerContainer(
            themeManagerController: _themeManagerController),
      ],
    );
  }
}
