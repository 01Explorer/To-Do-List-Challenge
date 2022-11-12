import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:to_do_list_challenge/layers/data/datasources/local/repositories/create_tasks_repository_imp.dart';
import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';

class MockHiveBox extends Mock implements Box<TaskEntity> {}

class MockHiveInterface extends Mock implements HiveInterface {}

void main() {
  final mockHiveInterface = MockHiveInterface();
  final mockBox = MockHiveBox();
  final repository = CreateTasksRepositoryImp(mockBox);
  test('Should return a boolean value', () {
    when(() => mockHiveInterface.openBox(any())).thenAnswer(
      (_) async => mockBox,
    );
    when(
      () => mockBox.containsKey(any()),
    ).thenReturn(true);
    var result = repository('Gabriel', 'content', DateTime.now());
    expect(result, isA<bool>());
  });
  test('If the key exists should return false', () {
    when(() => mockHiveInterface.openBox(any())).thenAnswer(
      (_) async => mockBox,
    );
    when(
      () => mockBox.containsKey(any()),
    ).thenReturn(true);
    var result = repository('Gabriel', 'content', DateTime.now());
    expect(result, false);
  });
  test('If the key doesn\'t exist should return true', () {
    when(() => mockHiveInterface.openBox(any())).thenAnswer(
      (_) async => mockBox,
    );
    when(
      () => mockBox.containsKey(any()),
    ).thenReturn(false);
    when(
      () => mockBox.put(
        'Gabriel',
        TaskEntity(
          title: 'Gabriel',
          description: 'content',
          expiryDate: DateTime.now(),
        ),
      ),
    ).thenAnswer((_) async {
      Future.value();
    });
    verify(
      () => mockBox.put(
        'Gabriel',
        TaskEntity(
          title: 'Gabriel',
          description: 'content',
          expiryDate: DateTime.now(),
        ),
      ),
    ).called(1);
    var result = repository('Gabriel', 'content', DateTime.now());
    expect(result, false);
  });
}
