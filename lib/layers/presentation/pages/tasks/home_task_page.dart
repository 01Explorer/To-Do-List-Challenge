import 'package:flutter/material.dart';
import 'package:to_do_list_challenge/layers/presentation/components/custom_list_view_builder_based_on_options.dart';
import 'package:to_do_list_challenge/layers/presentation/components/widgets/home_task_screen/custom_list_tile_for_tasks.dart';
import 'package:to_do_list_challenge/layers/presentation/components/widgets/home_task_screen/number_of_complete_and_incomplete_tasks_row.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/home_controller.dart';
import 'package:to_do_list_challenge/layers/presentation/controllers/task_controller.dart';
import 'package:to_do_list_challenge/locator.dart';

import '../../../domain/entities/task_entity.dart';
import 'create_task_page.dart';

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
          padding: const EdgeInsets.fromLTRB(16, 71, 16, 56),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _homeScreenController.getFormattedInitialDate(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                        width: 48,
                        height: 48,
                        child: CircleAvatar(
                          backgroundColor: Colors.white54,
                        ))
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 16),
                    child: AnimatedBuilder(
                      animation: _taskController,
                      builder: (context, child) =>
                          NumberOfCompleteAndIncompleteTasksRow(
                              _taskController),
                    )),
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
                Visibility(
                  visible: _homeScreenController.isVisible,
                  child: TextField(
                    decoration: const InputDecoration(
                      label: Text('Search'),
                    ),
                    onChanged: (value) {
                      _homeScreenController
                          .setsearchTermForTitleFiltering(value);
                    },
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Incomplete',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _homeScreenController.setVisibilityOnIconClick();
                        });
                      },
                      icon: const Icon(
                        Icons.search,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // _homeScreenController.newRangeToFilter =
                        showDateRangePicker(
                                context: context,
                                firstDate: DateTime(2021),
                                lastDate: DateTime(2025))
                            .then((value) {
                          if (value != null) {
                            return _homeScreenController
                                .setNewRangeToFilter(value);
                          }
                        });
                      },
                      icon: const Icon(
                        Icons.calendar_month,
                      ),
                    ),
                    IconButton(
                        onPressed: () =>
                            _homeScreenController.resetDateBetweenFiltering(),
                        icon: Icon(Icons.refresh))
                  ],
                ),
                SizedBox(
                  height: 230,
                  width: double.infinity,
                  child: AnimatedBuilder(
                    animation: Listenable.merge(
                        [_taskController, _homeScreenController]),
                    builder: (BuildContext context, Widget? child) {
                      return returnTheListViewBuilderForIncompleteSectionBasedOnPageSettings();
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Text(
                      'Complete',
                      style: Theme.of(context).textTheme.headlineSmall,
                    )
                  ],
                ),
                SizedBox(
                  height: 230,
                  width: double.infinity,
                  child: AnimatedBuilder(
                    animation: _taskController,
                    builder: (BuildContext context, Widget? child) {
                      final List<TaskEntity> completeTasksList =
                          _taskController.getCompletedTasks();
                      return ListView.builder(
                        itemCount: completeTasksList.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (completeTasksList.isNotEmpty) {
                            TaskEntity task = completeTasksList[index];
                            return CustomListTileForTasks(task: task);
                          }
                          return Container();
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      clipBehavior: Clip.hardEdge,
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateTaskPage(),
                            fullscreenDialog: true),
                      ),
                      child: const Icon(Icons.add),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget returnTheListViewBuilderForIncompleteSectionBasedOnPageSettings() {
    if (_homeScreenController.isVisible) {
      _homeScreenController.setListOfTasksIncomplete(
          _taskController.getTasksFilteredByTitle(
              _homeScreenController.searchTermForTitleFiltering));
      return CustomListViewBuilderBasedOnOptions(
          listWithDesiredTasks:
              _homeScreenController.getListOfTasksIncomplete());
    }
    if (_homeScreenController.newRangeToFilter != null) {
      _homeScreenController.setListOfTasksIncomplete(
          _taskController.getTasksFilteredByDateBetween(
        _homeScreenController.newRangeToFilter!.start,
        _homeScreenController.newRangeToFilter!.end,
      ));
      return CustomListViewBuilderBasedOnOptions(
          listWithDesiredTasks:
              _homeScreenController.getListOfTasksIncomplete());
    }
    _homeScreenController
        .setListOfTasksIncomplete(_taskController.getIncompleteTasks());
    return CustomListViewBuilderBasedOnOptions(
        listWithDesiredTasks: _homeScreenController.getListOfTasksIncomplete());
  }
}
