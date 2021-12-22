import 'package:crud_hive/features/crud/data/datasources/create_task_data_source.dart';
import 'package:crud_hive/features/crud/data/repositories/create_task_repository_impl.dart';
import 'package:crud_hive/features/crud/domain/entities/task.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'create_task_repository_impl_test.mocks.dart';

@GenerateMocks([CreateTaskDataSource])
void main() {
  late CreateTaskRepositoryImpl createTaskRepositoryImpl;
  late MockCreateTaskDataSource mockCreateTaskDataSource;

  setUp(() {
    mockCreateTaskDataSource = MockCreateTaskDataSource();
    createTaskRepositoryImpl = CreateTaskRepositoryImpl(
      mockCreateTaskDataSource,
    );
  });

  var _tTask = Task(
    name: 'name',
    isCompleted: false,
    date: 'date',
    time: 'time',
  );

  test('Should create a Task from the Repository Impl.', () async {
    // arrange
    when(mockCreateTaskDataSource.create(task: _tTask));
    // act
    await createTaskRepositoryImpl.create(task: _tTask);
    // assert
    verify(mockCreateTaskDataSource.create(task: _tTask));
  });
}
