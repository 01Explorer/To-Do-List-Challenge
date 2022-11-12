import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';
import 'package:to_do_list_challenge/layers/domain/repositories/get_incomplete_tasks/get_incomplete_tasks_repository.dart';

class GetIncompleteTasksRepositoryImp implements GetIncompleteTasksRepository {
  final Box<TaskEntity> hiveBox;

  GetIncompleteTasksRepositoryImp(this.hiveBox);
  @override
  List<TaskEntity> call() {
    List<TaskEntity> incompleteTasks =
        hiveBox.values.where((e) => e.isCompleted == false).toList();
    return incompleteTasks;
  }
}
