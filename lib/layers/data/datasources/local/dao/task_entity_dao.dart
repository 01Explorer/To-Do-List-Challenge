import 'package:hive/hive.dart';
import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';

part 'task_entity_dao.g.dart';

@HiveType(typeId: 0)
class TaskEntityDao extends TaskEntity with HiveObjectMixin {
  TaskEntityDao({
    required this.taskTitle,
    required this.content,
    required this.endDate,
    this.status = false,
  }) : super(
            title: taskTitle,
            description: content,
            expiryDate: endDate,
            isCompleted: status ?? false);

  @HiveField(0)
  String taskTitle;

  @HiveField(1)
  String content;

  @HiveField(2)
  DateTime endDate;

  @HiveField(3)
  bool? status;

  factory TaskEntityDao.fromTaskEntity(TaskEntity task) {
    return TaskEntityDao(
        taskTitle: task.title,
        content: task.description,
        endDate: task.expiryDate,
        status: task.isCompleted);
  }
}
