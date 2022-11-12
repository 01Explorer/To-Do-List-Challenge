import 'package:to_do_list_challenge/layers/domain/usecases/create_tasks/create_tasks_usecase.dart';

import '../../repositories/create_tasks/create_tasks_repository.dart';

class CreateTasksUsecaseImp implements CreateTasksUsecase {
  final CreateTasksRepository _createTasksUsecaseRepository;

  CreateTasksUsecaseImp(this._createTasksUsecaseRepository);
  @override
  bool call(String title, String description, DateTime expiryDate) {
    return _createTasksUsecaseRepository(title, description, expiryDate);
  }
}
