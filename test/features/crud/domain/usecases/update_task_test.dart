import 'package:crud_hive/features/crud/domain/entities/task.dart';
import 'package:crud_hive/features/crud/domain/repositories/update_task_repository.dart';
import 'package:crud_hive/features/crud/domain/usecases/update_task.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'update_task_test.mocks.dart';

@GenerateMocks([UpdateTaskRepository])
void main() {
  late UpdateTask usecase;
  late MockUpdateTaskRepository mockUpdateTaskRepository;

  setUp(() {
    mockUpdateTaskRepository = MockUpdateTaskRepository();
    usecase = UpdateTask(mockUpdateTaskRepository);
  });

  var _tIndex = 1;
  var _tTask = Task(
    name: 'name',
    isCompleted: false,
    date: 'date',
    time: 'time',
  );

  test('Should update a Task from the repository. ', () async {
    // arrange
    when(mockUpdateTaskRepository.update(index: _tIndex, task: _tTask));
    // act
    await usecase.update(index: _tIndex, task: _tTask);
    // assert
    verify(mockUpdateTaskRepository.update(index: _tIndex, task: _tTask));
    verifyNoMoreInteractions(mockUpdateTaskRepository);
  });
}
