import '../../entities/task_entity.dart';

abstract class DeleteTasksRepository {
  bool call(TaskEntity task);
}
