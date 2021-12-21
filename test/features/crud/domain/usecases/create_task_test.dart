import 'package:crud_hive/features/crud/domain/entities/task.dart';
import 'package:crud_hive/features/crud/domain/repositories/create_task_repository.dart';
import 'package:crud_hive/features/crud/domain/usecases/create_task.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'create_task_test.mocks.dart';

@GenerateMocks([CreateTaskRepository])
void main() {
  late CreateTask usecase;
  late MockCreateTaskRepository mockCreateTaskRepository;

  setUp(() {
    mockCreateTaskRepository = MockCreateTaskRepository();
    usecase = CreateTask(mockCreateTaskRepository);
  });

  var _tTask = Task(
    name: 'name',
    isCompleted: false,
    date: 'date',
    time: 'time',
  );

  test('Should create a Task from the repository.', () async {
    // arrange
    when(mockCreateTaskRepository.create(task: _tTask));
    // act
    await usecase.create(task: _tTask);
    // assert
    verify(mockCreateTaskRepository.create(task: _tTask));
    verifyNoMoreInteractions(mockCreateTaskRepository);
  });
}
