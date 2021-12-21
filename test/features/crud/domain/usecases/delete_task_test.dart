import 'package:crud_hive/features/crud/domain/repositories/delete_task_repository.dart';
import 'package:crud_hive/features/crud/domain/usecases/delete_task.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'delete_task_test.mocks.dart';

@GenerateMocks([DeleteTaskRepository])
void main() {
  late DeleteTask usecase;
  late MockDeleteTaskRepository mockDeleteTaskRepository;

  setUp(() {
    mockDeleteTaskRepository = MockDeleteTaskRepository();
    usecase = DeleteTask(mockDeleteTaskRepository);
  });

  var _tIndex = 1;

  test('Should delete a Task from the repository.', () async {
    // arrange
    when(mockDeleteTaskRepository.delete(index: _tIndex));
    // act
    await usecase.delete(index: _tIndex);
    // assert
    verify(mockDeleteTaskRepository.delete(index: _tIndex));
    verifyNoMoreInteractions(mockDeleteTaskRepository);
  });
}
