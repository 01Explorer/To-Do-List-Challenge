import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';
import 'package:to_do_list_challenge/layers/domain/repositories/filter_tasks_by_date_between/filter_tasks_by_date_between_repository.dart';

class FilterTasksByDateBetweenRepositoryImp
    implements FilterTasksByDateBetweenRepository {
  final Box<TaskEntity> hiveBox;

  FilterTasksByDateBetweenRepositoryImp(this.hiveBox);
  @override
  List<TaskEntity> call(DateTime startDate, DateTime endDate) {
    return hiveBox.values
        .where((e) =>
            e.expiryDate.isAfter(startDate.subtract(const Duration(days: 1))) &&
            e.expiryDate.isBefore(endDate) &&
            e.isCompleted == false)
        .toList();
  }
}
