import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';

class TaskDto extends TaskEntity {
  final String taskName;
  final String content;
  final DateTime endDate;

  TaskDto({
    required this.taskName,
    required this.content,
    required this.endDate,
  }) : super(
          title: taskName,
          description: content,
          expiryDate: endDate,
        );

  Map toJson() {
    return {
      'title': taskName,
      'description': content,
      'expiryDate': endDate,
    };
  }

  TaskDto fromJson(Map map) {
    return TaskDto(
        taskName: map['title'],
        content: map['description'],
        endDate: map['expiryDate']);
  }
}
