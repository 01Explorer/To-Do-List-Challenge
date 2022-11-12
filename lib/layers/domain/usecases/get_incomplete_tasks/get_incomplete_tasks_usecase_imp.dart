import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';
import 'package:to_do_list_challenge/layers/domain/repositories/get_incomplete_tasks/get_incomplete_tasks_repository.dart';
import 'package:to_do_list_challenge/layers/domain/usecases/get_incomplete_tasks/get_incomplete_tasks_usecase.dart';

class GetIncompleteTasksUsecaseImp extends GetIncompleteTasksUsecase {
  final GetIncompleteTasksRepository _getIncompleteTasksRepository;

  GetIncompleteTasksUsecaseImp(this._getIncompleteTasksRepository);
  @override
  List<TaskEntity> call() {
    return _getIncompleteTasksRepository();
  }
}
