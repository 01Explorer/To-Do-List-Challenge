import 'package:flutter/material.dart';
import 'package:to_do_list_challenge/layers/presentation/components/sections/home_task_page/completed_tasks_section.dart';
import 'package:to_do_list_challenge/layers/presentation/components/sections/home_task_page/home_task_page_header.dart';
import 'package:to_do_list_challenge/layers/presentation/components/sections/home_task_page/incomplete_tasks_section.dart';
import 'package:to_do_list_challenge/layers/presentation/components/widgets/home_task_screen/visibility_search_text_field.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/home_controller.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/task_controller.dart';
import 'package:to_do_list_challenge/locator.dart';
import '../../components/widgets/home_task_screen/custom_floating_action_button.dart';

class HomeTaskPage extends StatefulWidget {
  const HomeTaskPage({Key? key}) : super(key: key);

  @override
  State<HomeTaskPage> createState() => _HomeTaskPageState();
}

class _HomeTaskPageState extends State<HomeTaskPage> {
  final HomeController _homeScreenController = locator.get<HomeController>();
  final TaskController _taskController = locator.get<TaskController>();

  @override
  void initState() {
    super.initState();

    _homeScreenController
        .setListOfTasksIncomplete(_taskController.getIncompleteTasks());
    _homeScreenController
        .setListOfTasksComplete(_taskController.getCompletedTasks());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 56),
          child: SizedBox(
            child: Column(
              children: [
                HomeTaskPageHeader(_homeScreenController, _taskController),
                const SizedBox(
                  height: 8,
                ),
                VisibilitySearchTextField(_homeScreenController),
                const SizedBox(
                  height: 8,
                ),
                IncompleteTasksSection(_homeScreenController, _taskController),
                const SizedBox(
                  height: 8,
                ),
                CompletedTasksSection(_taskController, _homeScreenController),
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: CustomFloatingActionButton(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
