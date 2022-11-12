class TaskEntity {
  String title;
  String description;
  DateTime expiryDate;
  bool isCompleted;

  TaskEntity({
    required this.title,
    required this.description,
    required this.expiryDate,
    this.isCompleted = false,
  });

  int daysToFinishTask() {
    return expiryDate.difference(DateTime.now()).inDays + 1;
  }
}
