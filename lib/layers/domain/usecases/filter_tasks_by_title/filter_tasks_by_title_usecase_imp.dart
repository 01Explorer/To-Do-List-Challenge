import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';
import 'package:to_do_list_challenge/layers/domain/repositories/filter_tasks_by_title/filter_tasks_by_title_repository.dart';
import 'package:to_do_list_challenge/layers/domain/usecases/filter_tasks_by_title/filter_tasks_by_title_usecase.dart';

class FilterTasksByTitleUsecaseImp implements FilterTasksByTitleUsecase {
  final FilterTasksByTitleRepository _filterTasksByTitleRepository;

  FilterTasksByTitleUsecaseImp(this._filterTasksByTitleRepository);
  @override
  List<TaskEntity> call(String searchTerm) {
    return _filterTasksByTitleRepository(searchTerm);
  }
}
