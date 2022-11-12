import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';
import 'package:to_do_list_challenge/layers/domain/repositories/filter_tasks_by_date_between/filter_tasks_by_date_between_repository.dart';
import 'package:to_do_list_challenge/layers/domain/usecases/filter_tasks_by_date_between/filter_tasks_by_date_between_usecase.dart';

class FilterTasksByDateBetweenUsecaseImp
    implements FilterTasksByDateBetweenUsecase {
  final FilterTasksByDateBetweenRepository _filterTasksByDateBetweenRepository;

  FilterTasksByDateBetweenUsecaseImp(this._filterTasksByDateBetweenRepository);

  @override
  List<TaskEntity> call(DateTime startDate, DateTime endDate) {
    return _filterTasksByDateBetweenRepository(startDate, endDate);
  }
}
