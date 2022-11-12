import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';
import 'package:to_do_list_challenge/layers/domain/repositories/filter_tasks_by_title/filter_tasks_by_title_repository.dart';

class FilterTasksByTitleRepositoryImp implements FilterTasksByTitleRepository {
  final Box<TaskEntity> hiveBox;

  FilterTasksByTitleRepositoryImp(this.hiveBox);
  @override
  List<TaskEntity> call(String searchTerm) {
    return hiveBox.values
        .where((e) => e.title.toLowerCase().contains(searchTerm.toLowerCase()))
        .toList();
  }
}
