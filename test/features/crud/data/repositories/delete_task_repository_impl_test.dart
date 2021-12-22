import 'package:crud_hive/features/crud/data/datasources/delete_task_data_source.dart';
import 'package:crud_hive/features/crud/data/repositories/delete_task_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'delete_task_repository_impl_test.mocks.dart';

@GenerateMocks([DeleteTaskDataSource])
void main() {
  late DeleteTaskRepositoryImpl deleteTaskRepositoryImpl;
  late MockDeleteTaskDataSource mockDeleteTaskDataSource;

  setUp(() {
    mockDeleteTaskDataSource = MockDeleteTaskDataSource();
    deleteTaskRepositoryImpl = DeleteTaskRepositoryImpl(
      mockDeleteTaskDataSource,
    );
  });

  var _tIndex = 0;

  test('Should delete a Task from the Repository Impl.', () async {
    // arrange
    when(mockDeleteTaskDataSource.delete(index: _tIndex));
    // act
    await deleteTaskRepositoryImpl.delete(index: _tIndex);
    // assert
    verify(mockDeleteTaskDataSource.delete(index: _tIndex));
  });
}
