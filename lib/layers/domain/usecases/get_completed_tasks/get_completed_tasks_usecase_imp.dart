import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';
import 'package:to_do_list_challenge/layers/domain/repositories/get_completed_tasks/get_completed_tasks_repository.dart';
import 'package:to_do_list_challenge/layers/domain/usecases/get_completed_tasks/get_completed_tasks_usecase.dart';

class GetCompletedTasksUsecaseImp implements GetCompletedTasksUsecase {
  final GetCompletedTasksRepository _completedTasksRepository;

  GetCompletedTasksUsecaseImp(this._completedTasksRepository);
  @override
  List<TaskEntity> call() {
    return _completedTasksRepository();
  }
}
