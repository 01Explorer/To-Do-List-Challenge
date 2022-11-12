import 'package:hive/hive.dart';
import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';
import 'package:to_do_list_challenge/layers/domain/repositories/delete_tasks/delete_tasks_repository.dart';

class DeleteTasksRepositoryImp implements DeleteTasksRepository {
  final Box<TaskEntity> hiveBox;

  DeleteTasksRepositoryImp(this.hiveBox);
  @override
  bool call(TaskEntity task) {
    if (hiveBox.containsKey(task.title.toLowerCase())) {
      hiveBox.delete(task.title.toLowerCase());
      return true;
    }
    return false;
  }
}
