import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';

abstract class EditTasksRepository {
  bool call(TaskEntity task, String initialTitle);
}
