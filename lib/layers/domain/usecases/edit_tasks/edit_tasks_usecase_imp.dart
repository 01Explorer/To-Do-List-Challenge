import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';
import 'package:to_do_list_challenge/layers/domain/usecases/edit_tasks/edit_tasks_usecase.dart';
import '../../repositories/edit_tasks/edit_tasks_repository.dart';

class EditTasksUsecaseImp implements EditTasksUsecase {
  final EditTasksRepository _editTasksRepository;

  EditTasksUsecaseImp(this._editTasksRepository);
  @override
  bool call(TaskEntity task, String initialTitle) {
    return _editTasksRepository.call(task, initialTitle);
  }
}
