import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';
import 'package:to_do_list_challenge/layers/domain/repositories/mark_a_task_as_done/mark_a_task_as_done_repository.dart';
import 'package:to_do_list_challenge/layers/domain/usecases/mark_a_task_as_done/mark_a_task_as_done_usecase.dart';

class MarkATaskAsDoneUsecaseImp implements MarkATaskAsDoneUsecase {
  final MarkATaskAsDoneRepository _markATaskAsDoneRepository;

  MarkATaskAsDoneUsecaseImp(this._markATaskAsDoneRepository);
  @override
  void call(TaskEntity task) {
    _markATaskAsDoneRepository(task);
  }
}
