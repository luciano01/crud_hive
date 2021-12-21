import 'package:crud_hive/features/crud/domain/entities/task.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'task_test.mocks.dart';

@GenerateMocks([Task])
void main() {
  late MockTask mockTask;

  setUp(() {
    mockTask = MockTask();
  });

  test('name field should be a String type.', () {
    // arrange
    when(mockTask.name).thenAnswer((_) => 'name');

    // assert
    expect(mockTask.name, isA<String>());
  });

  test('isCompleted field should be a bool type.', () {
    // arrange
    when(mockTask.isCompleted).thenAnswer((_) => true);

    // assert
    expect(mockTask.isCompleted, isA<bool>());
  });

  test('date field should be a String type.', () {
    // arrange
    when(mockTask.date).thenAnswer((_) => 'date');

    // assert
    expect(mockTask.date, isA<String>());
  });

  test('time field should be a String type.', () {
    // arrange
    when(mockTask.time).thenAnswer((_) => 'time');

    // assert
    expect(mockTask.time, isA<String>());
  });
}
