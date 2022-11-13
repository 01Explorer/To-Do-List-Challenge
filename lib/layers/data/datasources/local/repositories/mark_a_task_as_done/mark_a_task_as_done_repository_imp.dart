import 'package:hive/hive.dart';
import 'package:to_do_list_challenge/layers/data/datasources/local/dao/task_entity_dao.dart';
import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';
import 'package:to_do_list_challenge/layers/domain/repositories/mark_a_task_as_done/mark_a_task_as_done_repository.dart';

class MarkATaskAsDoneRepositoryImp implements MarkATaskAsDoneRepository {
  final Box<TaskEntity> hiveBox;

  MarkATaskAsDoneRepositoryImp(this.hiveBox);
  @override
  void call(TaskEntity task) {
    task.isCompleted = !task.isCompleted;
    TaskEntityDao taskDao = TaskEntityDao.fromTaskEntity(task);
    hiveBox.put(taskDao.title.toLowerCase(), taskDao);
  }
}
