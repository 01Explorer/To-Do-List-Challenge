import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';

abstract class EditTasksUsecase {
  bool call(TaskEntity task, String initialTitle);
}
