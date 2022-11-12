import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';
import 'package:to_do_list_challenge/layers/domain/repositories/get_completed_tasks/get_completed_tasks_repository.dart';

class GetCompletedTasksRepositoryImp implements GetCompletedTasksRepository {
  final Box<TaskEntity> hiveBox;

  GetCompletedTasksRepositoryImp(this.hiveBox);
  @override
  List<TaskEntity> call() {
    List<TaskEntity> completedTasks =
        hiveBox.values.where((e) => e.isCompleted == true).toList();
    return completedTasks;
  }
}
