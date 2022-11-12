import 'package:flutter/material.dart';
import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';
import 'package:to_do_list_challenge/layers/domain/usecases/create_tasks/create_tasks_usecase.dart';
import 'package:to_do_list_challenge/layers/domain/usecases/delete_tasks/delete_tasks_usecase.dart';
import 'package:to_do_list_challenge/layers/domain/usecases/edit_tasks/edit_tasks_usecase.dart';
import '../../domain/usecases/filter_tasks_by_date_between/filter_tasks_by_date_between_usecase.dart';
import '../../domain/usecases/filter_tasks_by_title/filter_tasks_by_title_usecase.dart';
import '../../domain/usecases/get_completed_tasks/get_completed_tasks_usecase.dart';
import '../../domain/usecases/get_incomplete_tasks/get_incomplete_tasks_usecase.dart';
import '../../domain/usecases/mark_a_task_as_done/mark_a_task_as_done_usecase.dart';

class TaskController extends ChangeNotifier {
  final CreateTasksUsecase _createTasksUsecase;
  final DeleteTasksUsecase _deleteTasksUsecase;
  final EditTasksUsecase _editTasksUsecase;
  final MarkATaskAsDoneUsecase _markATaskAsDoneUsecase;
  final GetIncompleteTasksUsecase _getIncompleteTasksUsecase;
  final GetCompletedTasksUsecase _getCompletedTasksUsecase;
  final FilterTasksByDateBetweenUsecase _filterTasksByDateBetweenUsecase;
  final FilterTasksByTitleUsecase _filterTasksByTitleUsecase;

  TaskController(
      this._createTasksUsecase,
      this._deleteTasksUsecase,
      this._editTasksUsecase,
      this._markATaskAsDoneUsecase,
      this._getIncompleteTasksUsecase,
      this._getCompletedTasksUsecase,
      this._filterTasksByDateBetweenUsecase,
      this._filterTasksByTitleUsecase);

  bool createTask(String title, String description, DateTime expiryDate) {
    bool result = _createTasksUsecase(title, description, expiryDate);
    notifyListeners();
    return result;
  }

  bool deleteTask(TaskEntity task) {
    bool result = _deleteTasksUsecase(task);
    notifyListeners();
    return result;
  }

  bool editTask(TaskEntity task, String initialTitle) {
    bool result = _editTasksUsecase(task, initialTitle);
    notifyListeners();
    return result;
  }

  changeTaskStatus(TaskEntity task) {
    _markATaskAsDoneUsecase(task);
    notifyListeners();
  }

  Color getSubtitle(TaskEntity task) {
    int days = task.daysToFinishTask();
    if (days >= 7) {
      return Colors.green;
    }
    if (days <= 6 && days >= 2) {
      return Colors.yellow;
    }
    return Colors.red;
  }

  List<TaskEntity> getIncompleteTasks() {
    return _getIncompleteTasksUsecase();
  }

  List<TaskEntity> getTasksFilteredByTitle(String searchTerm) {
    List<TaskEntity> returnList = _filterTasksByTitleUsecase(searchTerm);
    return returnList;
  }

  List<TaskEntity> getTasksFilteredByDateBetween(
      DateTime startDate, DateTime endDate) {
    List<TaskEntity> returnList =
        _filterTasksByDateBetweenUsecase(startDate, endDate);

    return returnList;
  }

  List<TaskEntity> getCompletedTasks() {
    List<TaskEntity> returnList = _getCompletedTasksUsecase();
    return returnList;
  }
}
