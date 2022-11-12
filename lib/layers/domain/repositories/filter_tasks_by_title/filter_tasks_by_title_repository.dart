import '../../entities/task_entity.dart';

abstract class FilterTasksByTitleRepository {
  List<TaskEntity> call(String searchTerm);
}
