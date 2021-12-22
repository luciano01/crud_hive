import 'package:crud_hive/features/crud/data/datasources/update_task_data_source.dart';
import 'package:crud_hive/features/crud/data/repositories/update_task_repository_impl.dart';
import 'package:crud_hive/features/crud/domain/entities/task.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'update_task_repository_impl_test.mocks.dart';

@GenerateMocks([UpdateTaskDataSource])
void main() {
  late UpdateTaskRepositoryImpl updateTaskRepositoryImpl;
  late MockUpdateTaskDataSource mockUpdateTaskDataSource;

  setUp(() {
    mockUpdateTaskDataSource = MockUpdateTaskDataSource();
    updateTaskRepositoryImpl = UpdateTaskRepositoryImpl(
      mockUpdateTaskDataSource,
    );
  });

  var _tIndex = 0;
  var _tTask = Task(
    name: 'name',
    isCompleted: false,
    date: 'date',
    time: 'time',
  );

  test('Should create a Task from the Repository Impl.', () async {
    // arrange
    when(mockUpdateTaskDataSource.update(index: _tIndex, task: _tTask));
    // act
    await updateTaskRepositoryImpl.update(index: _tIndex, task: _tTask);
    // assert
    verify(mockUpdateTaskDataSource.update(index: _tIndex, task: _tTask));
  });
}
