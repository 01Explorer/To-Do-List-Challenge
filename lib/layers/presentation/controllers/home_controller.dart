import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/task_entity.dart';

class HomeController extends ChangeNotifier {
  bool isVisible = false;
  DateTimeRange? newRangeToFilter;
  List<TaskEntity> _listOfTasksBeingShownOnIncomplete = [];
  List<TaskEntity> _listOfTasksBeingShownOnComplete = [];
  String searchTermForTitleFiltering = '';

  setVisibilityOnIconClick() {
    isVisible = !isVisible;
    notifyListeners();
  }

  resetDateBetweenFiltering() {
    newRangeToFilter = null;
    notifyListeners();
  }

  setNewRangeToFilter(DateTimeRange value) {
    newRangeToFilter = value;
    notifyListeners();
  }

  setsearchTermForTitleFiltering(String searchTerm) {
    searchTermForTitleFiltering = searchTerm.toLowerCase();
    notifyListeners();
  }

  String getFormattedInitialDate() {
    return DateFormat('MMMM d, yyyy').format(DateTime.now());
  }

  setListOfTasksIncomplete(List<TaskEntity> baseList) {
    _listOfTasksBeingShownOnIncomplete = baseList;
  }

  setListOfTasksComplete(List<TaskEntity> baseList) {
    _listOfTasksBeingShownOnComplete = baseList;
  }

  List<TaskEntity> getListOfTasksIncomplete() {
    return _listOfTasksBeingShownOnIncomplete;
  }

  List<TaskEntity> getListOfTasksCompleted() {
    return _listOfTasksBeingShownOnComplete;
  }
}
