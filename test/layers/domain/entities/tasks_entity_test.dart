import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_list_challenge/layers/domain/entities/task_entity.dart';

void main() {
  test('Should return a not null TaskEntity', () {
    TaskEntity entity =
        TaskEntity(title: '', description: '', expiryDate: DateTime.now());

    expect(entity, isNotNull);
  });
  test('The expiryDate should return a DateTime now', () {
    TaskEntity entity =
        TaskEntity(title: '', description: '', expiryDate: DateTime.now());

    expect(entity.expiryDate, DateTime.now());
  });
  test('The title should be "Gabriel"', () {
    TaskEntity entity = TaskEntity(
        title: 'Gabriel', description: '', expiryDate: DateTime.now());

    expect(entity.title, 'Gabriel');
  });
  test('The description should be "test"', () {
    TaskEntity entity = TaskEntity(
        title: 'Gabriel', description: 'test', expiryDate: DateTime.now());

    expect(entity.description, 'test');
  });
}
