import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_list_challenge/layers/data/datasources/local/repositories/delete_tasks_repository_imp.dart';
import 'package:to_do_list_challenge/layers/domain/usecases/delete_tasks/delete_tasks_usecase.dart';
import 'package:to_do_list_challenge/layers/domain/usecases/delete_tasks/delete_tasks_usecase_imp.dart';

void main() {
  test(
    'Should succesfully delete the TaskEntity',
    () {
      DeleteTasksUsecase useCase =
          DeleteTasksUsecaseImp(DeleteTasksRepositoryImp());
      var result = useCase.call();
      expect(result, true);
    },
  );
  test(
    'Shouldn\'t  delete the TaskEntity if the index is less than 0 ',
    () {
      DeleteTasksUsecase useCase =
          DeleteTasksUsecaseImp(DeleteTasksRepositoryImp());
      var result = useCase.call();
      expect(result, false);
    },
  );
  test(
    'Shouldn\'t  delete the TaskEntity if the index is over 100 ',
    () {
      DeleteTasksUsecase useCase =
          DeleteTasksUsecaseImp(DeleteTasksRepositoryImp());
      var result = useCase.call();
      expect(result, false);
    },
  );
}
