import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_challenge/layers/data/datasources/local/dao/task_entity_dao.dart';
import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';
import 'package:to_do_list_challenge/layers/domain/repositories/edit_tasks/edit_tasks_repository.dart';

class EditTasksRepositoryImp implements EditTasksRepository {
  final Box<TaskEntity> hiveBox;

  EditTasksRepositoryImp(this.hiveBox);
  @override
  bool call(TaskEntity task, String initialTitle) {
    TaskEntityDao taskDao = TaskEntityDao.fromTaskEntity(task);
    if (initialTitle.toLowerCase() != taskDao.title.toLowerCase()) {
      hiveBox.delete(initialTitle.toLowerCase());
      hiveBox.put(taskDao.title.toLowerCase(), taskDao);
      return true;
    }
    hiveBox.put(task.title.toLowerCase(), task);
    if (hiveBox.containsKey(task.title.toLowerCase())) {
      return true;
    }
    return false;
  }
}
