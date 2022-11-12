import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';
import 'package:to_do_list_challenge/layers/domain/repositories/delete_tasks/delete_tasks_repository.dart';
import 'package:to_do_list_challenge/layers/domain/usecases/delete_tasks/delete_tasks_usecase.dart';

class DeleteTasksUsecaseImp implements DeleteTasksUsecase {
  final DeleteTasksRepository _deleteTasksRepository;

  DeleteTasksUsecaseImp(this._deleteTasksRepository);
  @override
  bool call(TaskEntity task) {
    return _deleteTasksRepository.call(task);
  }
}
