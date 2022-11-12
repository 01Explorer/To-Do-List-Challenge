import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';

abstract class FilterTasksByDateBetweenUsecase {
  List<TaskEntity> call(DateTime startDate, DateTime endDate);
}
