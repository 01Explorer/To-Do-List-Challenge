import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:to_do_list_challenge/layers/data/datasources/local/repositories/create_tasks_repository_imp.dart';
import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';
import 'package:to_do_list_challenge/layers/domain/repositories/create_tasks/create_tasks_repository.dart';
import 'package:to_do_list_challenge/layers/domain/usecases/create_tasks/create_tasks_usecase.dart';
import 'package:to_do_list_challenge/layers/domain/usecases/create_tasks/create_tasks_usecase_imp.dart';

class MockHiveBox extends Mock implements Box<TaskEntity> {}

class MockHive extends Mock implements HiveInterface {}

class MockCreateTaskRepositoryImp extends Mock
    implements CreateTasksRepository {}

void main() {
  final mockRepo = MockCreateTaskRepositoryImp();
  final useCase = CreateTasksUsecaseImp(mockRepo);
  final mockHive = MockHive();
  final mockHiveBox = MockHiveBox();
  test('Should return a boolean when called', () {
    when(
      () => mockHive.openBox(any()),
    ).thenAnswer(
      (_) async => mockHiveBox,
    );
    when(
      () => mockHiveBox.put(
        'Gabriel',
        TaskEntity(
          title: 'Gabriel',
          description: 'content',
          expiryDate: DateTime.now(),
        ),
      ),
    ).thenAnswer((_) async {
      return Future.value();
    });
    when(
      () => mockHiveBox.containsKey(any()),
    ).thenReturn(false);

    var result = useCase('Gabriel', 'content', DateTime.now());
    expect(result, isA<bool>());
  });
}
