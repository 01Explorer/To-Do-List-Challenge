import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_challenge/layers/data/datasources/local/dao/task_entity_dao.dart';
import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';
import 'package:to_do_list_challenge/layers/domain/repositories/create_tasks/create_tasks_repository.dart';

class CreateTasksRepositoryImp implements CreateTasksRepository {
  final Box<TaskEntity> hiveBox;

  CreateTasksRepositoryImp(this.hiveBox);
  @override
  bool call(String title, String description, DateTime expiryDate) {
    TaskEntityDao task = TaskEntityDao(
        taskTitle: title,
        content: description,
        endDate: expiryDate,
        status: false);
    if (hiveBox.containsKey(title.toLowerCase())) {
      return false;
    }
    hiveBox.put(title.toLowerCase(), task);
    return true;
  }
}
