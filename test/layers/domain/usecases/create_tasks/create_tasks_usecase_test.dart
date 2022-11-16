import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:to_do_list_challenge/layers/domain/repositories/create_tasks/create_tasks_repository.dart';
import 'package:to_do_list_challenge/layers/domain/usecases/create_tasks/create_tasks_usecase_imp.dart';

class MockCreateTaskRepository extends Mock implements CreateTasksRepository {}

void main() {
  final mockRepo = MockCreateTaskRepository();
  final usecase = CreateTasksUsecaseImp(mockRepo);
  test('Should return a boolean when called', () {
    final response = usecase('Gabriel', 'teste', DateTime.now());
    expect(response, true);
  });
}
